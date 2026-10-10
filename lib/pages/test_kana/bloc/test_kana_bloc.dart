import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/model_config.dart';
import 'package:kana_master/domain/models/paint_stroke.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/domain/quiz_engine.dart';
import 'package:kana_master/pages/test_kana/services/drawing_report_share_service.dart';
import 'package:injectable/injectable.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:xml/xml.dart';

part 'test_kana_event.dart';
part 'test_kana_state.dart';

@injectable
class TestKanaBloc extends Bloc<TestKanaEvent, TestKanaState> {
  Interpreter? interpreter;
  final ModelConfig _hiraganaModelConfig = hiraganaModelV2;
  final ModelConfig _katakanaModelConfig = katakanaModelV1;
  final ModelConfig _kanjiModelConfig = kanjiModelV1;
  ModelConfig? _loadedModelConfig;
  final DrawingReportShareService _reportShareService =
      DrawingReportShareService();
  final QuizEngine _engine = QuizEngine();

  KanaType _currentKanaType = KanaType.hiragana;
  bool _useModel = false;
  List<String> _modelLabels = const [];

  /// Answer history, updated with this session's answers so later questions
  /// adapt immediately.
  Map<String, ItemStat> _stats = {};
  final Set<QuizItem> _asked = {};
  StartSession? _lastStart;

  TestKanaBloc() : super(TestKanaInitial()) {
    on<StartSession>(_startSession);
    on<ReviewMistakes>(_reviewMistakes);
    on<RestartSession>(_restartSession);
    on<OptionSelected>(_optionSelected);
    on<UpdateUserTextAnswer>(_updateUserTextAnswer);
    on<SubmitAnswer>(_submitAnswer);
    on<NextQuestion>(_nextQuestion);
    on<ResetTest>(_resetTest);
    on<EnableCheckAnswer>(_setDrawingStarted);
    on<StartStroke>(_startStroke);
    on<AddStroke>(_addStroke);
    on<ClearDrawing>(_clearDrawing);
    on<CaptureImage>(_captureImage);
    on<EvaluateImage>(_evaluateImage);
    on<ToggleKanjiTemplate>(_toggleKanjiTemplate);
    on<ReportDrawingFalseNegative>(_reportDrawingFalseNegative);
  }

  Future<void> _loadModel(ModelConfig modelConfig) async {
    if (_loadedModelConfig?.assetPath == modelConfig.assetPath &&
        interpreter != null) {
      return;
    }
    interpreter?.close();
    interpreter = await Interpreter.fromAsset(modelConfig.assetPath);
    _loadedModelConfig = modelConfig;
  }

  @override
  Future<void> close() {
    interpreter?.close();
    return super.close();
  }

  // ---------------------------------------------------------------------------
  // Session flow

  /// Items usable for [testType]: drawing needs stroke data, and the model
  /// can only judge items it has a class for.
  static List<QuizItem> usableItems(
    List<QuizItem> pool, {
    required TestType testType,
    required bool useModel,
  }) {
    if (testType != TestType.drawingTest) return pool;
    return pool
        .where((i) => i.drawable && (!useModel || i.modelClass != null))
        .toList();
  }

  static TestType testTypeFor(DifficultyLevel difficulty) =>
      difficulty == DifficultyLevel.high
          ? TestType.drawingTest
          : TestType.singleAnswer;

  FutureOr<void> _startSession(
      StartSession event, Emitter<TestKanaState> emit) {
    _lastStart = event;
    _currentKanaType = event.kanaType;
    _useModel = event.useModel;
    _modelLabels = event.modelLabels;
    _stats = Map.of(event.stats);
    _asked.clear();

    final TestType testType = testTypeFor(event.difficulty);
    final pool =
        usableItems(event.pool, testType: testType, useModel: event.useModel);
    if (pool.isEmpty) {
      emit(TestKanaInitial());
      return null;
    }
    final session = TestSession(
      kanaType: event.kanaType,
      difficulty: event.difficulty,
      testType: testType,
      pool: pool,
      length: event.length,
      isReview: event.isReview,
    );
    _advance(emit, session);
  }

  FutureOr<void> _reviewMistakes(
      ReviewMistakes event, Emitter<TestKanaState> emit) {
    final session = state.stateData.session;
    final start = _lastStart;
    if (session == null || start == null || session.mistakes.isEmpty) {
      return null;
    }
    final mistakes = session.mistakes.toSet().toList();
    add(StartSession(
      kanaType: start.kanaType,
      difficulty: start.difficulty,
      pool: mistakes,
      length: mistakes.length,
      useModel: start.useModel,
      modelLabels: start.modelLabels,
      stats: _stats,
      isReview: true,
    ));
  }

  FutureOr<void> _restartSession(
      RestartSession event, Emitter<TestKanaState> emit) {
    final start = _lastStart;
    if (start == null) {
      emit(TestKanaInitial());
      return null;
    }
    add(StartSession(
      kanaType: start.kanaType,
      difficulty: start.difficulty,
      pool: start.pool,
      length: start.length,
      useModel: start.useModel,
      modelLabels: start.modelLabels,
      stats: _stats,
      isReview: start.isReview,
    ));
  }

  /// Emits the next question, or the summary when the session is complete.
  void _advance(Emitter<TestKanaState> emit, TestSession session) {
    if (session.questionNumber >= session.length) {
      emit(SessionFinished(state.stateData.copyWith(
        session: session.copyWith(finished: true),
        phase: QuestionPhase.answering,
      )));
      return;
    }
    if (_asked.length >= session.pool.length) _asked.clear();
    final QuizItem item = _engine.pick(
      session.pool,
      stats: _stats,
      exclude: _asked,
      previous: session.current,
    );
    _asked.add(item);
    final bool singleChoice = session.testType == TestType.singleAnswer &&
        session.difficulty == DifficultyLevel.low;
    emit(QuestionReady(TestKanaStateData(
      session: session.copyWith(
        questionNumber: session.questionNumber + 1,
        current: item,
        options: singleChoice ? _engine.options(item, session.pool) : const [],
      ),
      currentScriptUsesModel: _useModel,
    )));
  }

  FutureOr<void> _optionSelected(
      OptionSelected event, Emitter<TestKanaState> emit) {
    if (state.stateData.revealed) return null;
    emit(AnswerChanged(state.stateData.copyWith(
      selectedOption: event.option,
      canSubmitAnswer: true,
    )));
  }

  FutureOr<void> _updateUserTextAnswer(
      UpdateUserTextAnswer event, Emitter<TestKanaState> emit) {
    if (state.stateData.revealed) return null;
    emit(AnswerChanged(state.stateData.copyWith(
      userTextAnswer: event.userAnswer,
      canSubmitAnswer: event.userAnswer.trim().isNotEmpty,
    )));
  }

  FutureOr<void> _submitAnswer(
      SubmitAnswer event, Emitter<TestKanaState> emit) {
    final data = state.stateData;
    final session = data.session;
    final item = data.current;
    if (session == null || item == null || data.revealed) return null;
    final bool isCorrect = session.difficulty == DifficultyLevel.low
        ? data.selectedOption?.label == item.label
        : QuizEngine.checkTypedAnswer(item, data.userTextAnswer);
    _handleResult(emit, isCorrect, data);
  }

  void _handleResult(
    Emitter<TestKanaState> emit,
    bool isCorrect,
    TestKanaStateData data,
  ) {
    final session = data.session!;
    final item = session.current!;
    _stats[item.symbol] =
        (_stats[item.symbol] ?? const ItemStat()).record(isCorrect);
    if (isCorrect) {
      final updated = session.copyWith(correctCount: session.correctCount + 1);
      emit(AnswerCorrect(data.copyWith(session: updated), item: item));
      _advance(emit, updated);
    } else {
      final updated = session.copyWith(mistakes: [...session.mistakes, item]);
      emit(AnswerWrong(
        data.copyWith(
          session: updated,
          phase: QuestionPhase.revealed,
          canSubmitAnswer: false,
        ),
        item: item,
      ));
    }
  }

  FutureOr<void> _nextQuestion(
      NextQuestion event, Emitter<TestKanaState> emit) {
    final session = state.stateData.session;
    if (session == null || !state.stateData.revealed) return null;
    _advance(emit, session);
  }

  FutureOr<void> _resetTest(ResetTest event, Emitter<TestKanaState> emit) {
    _lastStart = null;
    emit(TestKanaInitial());
  }

  // ---------------------------------------------------------------------------
  // Drawing

  FutureOr<void> _setDrawingStarted(
      EnableCheckAnswer event, Emitter<TestKanaState> emit) {
    if (state.stateData.revealed) return null;
    emit(AnswerChanged(state.stateData.copyWith(canSubmitAnswer: true)));
  }

  FutureOr<void> _startStroke(StartStroke event, Emitter<TestKanaState> emit) {
    if (state.stateData.revealed) return null;
    final List<List<Offset>> userStrokes =
        List.from(state.stateData.userStrokes)..add([event.point]);
    emit(AnswerChanged(state.stateData.copyWith(
      userStrokes: userStrokes,
      canSubmitAnswer: true,
    )));
  }

  FutureOr<void> _addStroke(AddStroke event, Emitter<TestKanaState> emit) {
    if (state.stateData.revealed) return null;
    final List<PaintStroke> strokes = List.from(state.stateData.strokes)
      ..add(event.stroke);
    List<List<Offset>> userStrokes = List.from(state.stateData.userStrokes);
    if (userStrokes.isEmpty) {
      userStrokes = [
        [event.stroke.from, event.stroke.to]
      ];
    } else {
      final current = List<Offset>.from(userStrokes.last)..add(event.stroke.to);
      userStrokes[userStrokes.length - 1] = current;
    }
    emit(AnswerChanged(state.stateData.copyWith(
      strokes: strokes,
      userStrokes: userStrokes,
      canReportDrawing: false,
    )));
  }

  FutureOr<void> _clearDrawing(
      ClearDrawing event, Emitter<TestKanaState> emit) {
    if (state.stateData.revealed) return null;
    emit(AnswerChanged(state.stateData.copyWith(
      strokes: const [],
      userStrokes: const [],
      canSubmitAnswer: false,
      canReportDrawing: false,
      reportBusy: false,
      clearLastDrawing: true,
      reportPredictedLabel: '',
      reportExpectedLabel: '',
      reportConfidence: 0,
    )));
  }

  FutureOr<void> _captureImage(
      CaptureImage event, Emitter<TestKanaState> emit) {
    if (state.stateData.revealed) return null;
    emit(TestKanaCapturing(state.stateData));
  }

  FutureOr<void> _evaluateImage(
      EvaluateImage event, Emitter<TestKanaState> emit) async {
    final item = state.stateData.current;
    if (item == null || state.stateData.revealed) return;

    if (!_useModel) {
      emit(PredictionInProgress(state.stateData));
      final bool success = await _evaluateStrokeDrawing(
        assetPath: item.strokeAsset,
        userStrokes: state.stateData.userStrokes,
      );
      _handleResult(
        emit,
        success,
        state.stateData.copyWith(
          canReportDrawing: false,
          lastDrawingPngBytes: event.pngBytes,
        ),
      );
      return;
    }

    final ModelConfig modelConfig = _modelConfigForKanaType();
    await _loadModel(modelConfig);
    emit(PredictionInProgress(state.stateData));

    final List<dynamic>? predictions = await predict(event.image, interpreter!);
    if (predictions == null) {
      emit(ErrorPredicting(state.stateData,
          msg: "Prediction failed. Try again."));
      return;
    }

    final List<double> p = predictions[0].cast<double>();
    final int predictedIndex = getIndexOfMaxValue(p);
    final double confidence = predictedIndex >= 0 && predictedIndex < p.length
        ? p[predictedIndex]
        : 0;
    final String predicted =
        predictedIndex >= 0 && predictedIndex < _modelLabels.length
            ? _modelLabels[predictedIndex]
            : 'unknown';
    final bool isMatch = predictedIndex == item.modelClass;

    _handleResult(
      emit,
      isMatch,
      state.stateData.copyWith(
        canReportDrawing: !isMatch,
        reportBusy: false,
        lastDrawingPngBytes: event.pngBytes,
        reportExpectedLabel: item.symbol,
        reportPredictedLabel: predicted,
        reportConfidence: confidence,
      ),
    );
  }

  FutureOr<void> _toggleKanjiTemplate(
      ToggleKanjiTemplate event, Emitter<TestKanaState> emit) {
    emit(AnswerChanged(state.stateData.copyWith(
      showKanjiTemplate: !state.stateData.showKanjiTemplate,
    )));
  }

  FutureOr<void> _reportDrawingFalseNegative(
      ReportDrawingFalseNegative event, Emitter<TestKanaState> emit) async {
    if (!state.stateData.canReportDrawing ||
        state.stateData.lastDrawingPngBytes == null) {
      emit(DrawingReportError(
        state.stateData,
        msg: 'No drawing available to report.',
      ));
      return;
    }

    emit(DrawingReportInProgress(state.stateData.copyWith(reportBusy: true)));
    try {
      await _reportShareService.shareFalseNegativeReport(
        script: _currentKanaType.name,
        expectedLabel: state.stateData.reportExpectedLabel,
        predictedLabel: state.stateData.reportPredictedLabel,
        confidence: state.stateData.reportConfidence,
        userStrokes: state.stateData.userStrokes,
        pngBytes: state.stateData.lastDrawingPngBytes!,
      );
      emit(DrawingReportShared(state.stateData.copyWith(
        reportBusy: false,
        canReportDrawing: false,
      )));
    } catch (e) {
      emit(DrawingReportError(
        state.stateData.copyWith(reportBusy: false),
        msg: e.toString(),
      ));
    }
  }

  ModelConfig _modelConfigForKanaType() {
    if (_currentKanaType == KanaType.katakana) {
      return _katakanaModelConfig;
    }
    if (_currentKanaType == KanaType.kanji) {
      return _kanjiModelConfig;
    }
    return _hiraganaModelConfig;
  }

  int _resolveNumClasses(ModelConfig modelConfig) {
    if (_currentKanaType == KanaType.kanji) {
      return _modelLabels.length;
    }
    return modelConfig.numClasses;
  }

  Future<bool> _evaluateStrokeDrawing({
    required String? assetPath,
    required List<List<Offset>> userStrokes,
  }) async {
    final normalizedUser = _normalizeUserStrokes(userStrokes);
    if (normalizedUser.isEmpty) return false;

    if (assetPath == null) return false;
    final expectedPaths = await _loadSvgPaths(assetPath);
    if (expectedPaths.isEmpty) return false;

    final expectedStrokes =
        expectedPaths.map(_samplePath).where((s) => s.length >= 2).toList();
    if (expectedStrokes.isEmpty) return false;
    final expectedCount = expectedStrokes.length;
    if (normalizedUser.length != expectedCount) {
      return false;
    }

    final int compareCount =
        math.min(normalizedUser.length, expectedStrokes.length);
    int matched = 0;
    double accumulated = 0;
    bool strictOrderedMatch = true;
    for (int i = 0; i < compareCount; i++) {
      final userStroke = normalizedUser[i];
      final expectedStroke = expectedStrokes[i];
      final score = _strokeSimilarity(userStroke, expectedStroke);
      final lengthRatio = _strokeLengthRatio(userStroke, expectedStroke);
      accumulated += score;
      if (score >= 0.64) matched++;
      if (score < 0.62 || lengthRatio < 0.5) {
        strictOrderedMatch = false;
      }
    }

    final coverage = matched / expectedCount;
    final avgScore = compareCount == 0 ? 0 : accumulated / compareCount;
    final countPenalty =
        (normalizedUser.length - expectedCount).abs() / expectedCount;
    final sequencePenalty =
        (1 - (compareCount / expectedCount)).clamp(0.0, 1.0);
    final finalScore = (coverage * 0.55) +
        (avgScore * 0.45) -
        (countPenalty * 0.2) -
        (sequencePenalty * 0.15);
    return strictOrderedMatch && finalScore >= 0.69;
  }

  img.Image preprocessImage(img.Image image) {
    final ModelConfig modelConfig = _modelConfigForKanaType();
    img.Image resizedImg = img.copyResize(
      image,
      width: modelConfig.inputSize,
      height: modelConfig.inputSize,
    );
    return img.grayscale(resizedImg);
  }

  Float32List imageToByteListFloat32(img.Image image) {
    final ModelConfig modelConfig = _modelConfigForKanaType();
    int inputSize = modelConfig.inputSize;
    double normalizeDivisor = modelConfig.normalize ? 255.0 : 1.0;
    var convertedBytes = Float32List(1 * inputSize * inputSize);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (int i = 0; i < inputSize; i++) {
      for (int j = 0; j < inputSize; j++) {
        img.Pixel pixel = image.getPixel(j, i);
        num red = pixel.r;
        num green = pixel.g;
        num blue = pixel.b;

        double grayValue = 0.299 * red + 0.587 * green + 0.114 * blue;
        buffer[pixelIndex++] = grayValue / normalizeDivisor;
      }
    }
    return buffer;
  }

  Future<List?> predict(img.Image image, Interpreter interpreter) async {
    List? output;
    try {
      img.Image preprocessedImage = preprocessImage(image);
      var input = imageToByteListFloat32(preprocessedImage);
      final ModelConfig modelConfig = _modelConfigForKanaType();
      var inputTensor =
          input.reshape([1, modelConfig.inputSize, modelConfig.inputSize, 1]);
      final int numClasses = _resolveNumClasses(modelConfig);
      output = List.filled(numClasses, 0).reshape([1, numClasses]);
      interpreter.run(inputTensor, output);
    } catch (e) {
      return null;
    }
    return output;
  }

  int getIndexOfMaxValue(List<double> predictions) {
    if (predictions.isEmpty) return -1;
    double maxValue = predictions[0];
    int maxIndex = 0;
    for (int i = 1; i < predictions.length; i++) {
      if (predictions[i] > maxValue) {
        maxValue = predictions[i];
        maxIndex = i;
      }
    }
    return maxIndex;
  }

  List<List<Offset>> _normalizeUserStrokes(List<List<Offset>> raw) {
    final strokes = raw.where((stroke) => stroke.length >= 2).toList();
    if (strokes.isEmpty) return const [];

    double minX = double.infinity;
    double minY = double.infinity;
    double maxX = double.negativeInfinity;
    double maxY = double.negativeInfinity;

    for (final stroke in strokes) {
      for (final point in stroke) {
        if (point.dx < minX) minX = point.dx;
        if (point.dy < minY) minY = point.dy;
        if (point.dx > maxX) maxX = point.dx;
        if (point.dy > maxY) maxY = point.dy;
      }
    }

    final width = (maxX - minX).abs();
    final height = (maxY - minY).abs();
    if (width < 1 || height < 1) return const [];
    const target = 109.0;
    const margin = 10.0;
    final scale = (target - margin * 2) / math.max(width, height);
    final offsetX = (target - width * scale) / 2;
    final offsetY = (target - height * scale) / 2;

    return strokes.map((stroke) {
      final points = stroke
          .map((p) => Offset(
                (p.dx - minX) * scale + offsetX,
                (p.dy - minY) * scale + offsetY,
              ))
          .toList();
      return _resampleStroke(points, 28);
    }).toList();
  }

  List<Offset> _samplePath(Path path, {int sampleCount = 28}) {
    final metrics = path.computeMetrics(forceClosed: false);
    final points = <Offset>[];
    for (final metric in metrics) {
      if (metric.length == 0) continue;
      for (int i = 0; i < sampleCount; i++) {
        final distance = metric.length * (i / (sampleCount - 1));
        final tangent = metric.getTangentForOffset(distance);
        if (tangent != null) points.add(tangent.position);
      }
    }
    return _resampleStroke(points, sampleCount);
  }

  List<Offset> _resampleStroke(List<Offset> points, int targetCount) {
    if (points.length <= 1) return points;
    final cumulative = <double>[0];
    for (int i = 1; i < points.length; i++) {
      cumulative.add(cumulative.last + (points[i] - points[i - 1]).distance);
    }
    final total = cumulative.last;
    if (total <= 0) return points;

    final result = <Offset>[];
    for (int i = 0; i < targetCount; i++) {
      final targetDistance = total * (i / (targetCount - 1));
      int segment = 1;
      while (
          segment < cumulative.length && cumulative[segment] < targetDistance) {
        segment++;
      }
      if (segment >= cumulative.length) {
        result.add(points.last);
        continue;
      }
      final prev = segment - 1;
      final span = cumulative[segment] - cumulative[prev];
      final t = span <= 0 ? 0.0 : (targetDistance - cumulative[prev]) / span;
      result.add(Offset.lerp(points[prev], points[segment], t)!);
    }
    return result;
  }

  double _strokeSimilarity(List<Offset> user, List<Offset> expected) {
    if (user.length < 2 || expected.length < 2) return 0;
    final startDist = (user.first - expected.first).distance / 109.0;
    final endDist = (user.last - expected.last).distance / 109.0;

    final userVec = user.last - user.first;
    final expectedVec = expected.last - expected.first;
    final userLen = userVec.distance;
    final expectedLen = expectedVec.distance;
    final direction = (userLen > 0 && expectedLen > 0)
        ? ((userVec.dx * expectedVec.dx + userVec.dy * expectedVec.dy) /
                (userLen * expectedLen))
            .clamp(-1.0, 1.0)
        : 0.0;
    final directionScore = ((direction + 1) / 2);
    final lengthRatio = _strokeLengthRatio(user, expected);

    double meanPointDistance = 0;
    final pointCount = math.min(user.length, expected.length);
    for (int i = 0; i < pointCount; i++) {
      meanPointDistance += (user[i] - expected[i]).distance;
    }
    meanPointDistance =
        pointCount == 0 ? 109.0 : meanPointDistance / pointCount;
    final shapeScore = (1.0 - (meanPointDistance / 109.0)).clamp(0.0, 1.0);

    final startScore = (1.0 - startDist).clamp(0.0, 1.0);
    final endScore = (1.0 - endDist).clamp(0.0, 1.0);

    return (startScore * 0.18) +
        (endScore * 0.18) +
        (directionScore * 0.14) +
        (lengthRatio * 0.28) +
        (shapeScore * 0.22);
  }

  double _strokeLengthRatio(List<Offset> user, List<Offset> expected) {
    final userPathLen = _strokePathLength(user);
    final expectedPathLen = _strokePathLength(expected);
    if (userPathLen <= 0 || expectedPathLen <= 0) return 0;
    return (math.min(userPathLen, expectedPathLen) /
            math.max(userPathLen, expectedPathLen))
        .clamp(0.0, 1.0);
  }

  double _strokePathLength(List<Offset> points) {
    if (points.length < 2) return 0;
    double total = 0;
    for (int i = 1; i < points.length; i++) {
      total += (points[i] - points[i - 1]).distance;
    }
    return total;
  }

  Future<List<Path>> _loadSvgPaths(String assetPath) async {
    String svgString;
    try {
      svgString = await rootBundle.loadString(assetPath);
    } catch (_) {
      return const [];
    }
    final document = XmlDocument.parse(svgString);
    final paths = <Path>[];
    for (final element in document.descendants.whereType<XmlElement>()) {
      if (element.name.local != 'path') continue;
      final d = element.getAttribute('d');
      if (d == null || d.isEmpty) continue;
      paths.add(parseSvgPathData(d));
    }
    return paths;
  }
}
