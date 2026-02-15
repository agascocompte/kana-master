import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/model_config.dart';
import 'package:kana_master/domain/models/paint_stroke.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/test_kana/services/drawing_report_share_service.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:xml/xml.dart';

part 'test_kana_event.dart';
part 'test_kana_state.dart';

@injectable
class TestKanaBloc extends Bloc<TestKanaEvent, TestKanaState> {
  final random = math.Random();
  Interpreter? interpreter;
  final ModelConfig _hiraganaModelConfig = hiraganaModelV2;
  final ModelConfig _katakanaModelConfig = katakanaModelV1;
  final ModelConfig _kanjiModelConfig = kanjiModelV1;
  KanaType _currentKanaType = KanaType.hiragana;
  bool _useModelHiragana = true;
  bool _useModelKatakana = true;
  bool _useModelKanji = false;
  List<KanjiEntry> _kanjiEntries = const [];
  Map<String, List<String>> _kanjiMeanings = const {};
  ModelConfig? _loadedModelConfig;
  final DrawingReportShareService _reportShareService =
      DrawingReportShareService();

  TestKanaBloc() : super(TestKanaInitial()) {
    on<BeginTest>(_beginTest);
    on<EnableCheckAnswer>(_setDrawingStarted);
    on<AddStroke>(_addStroke);
    on<ClearDrawing>(_clearDrawing);
    on<ResetTest>(_resetTest);
    on<EvaluateImage>(_evaluateImage);
    on<CaptureImage>(_captureImage);
    on<TestNextKana>(_nextKana);
    on<UpdateUserKanaIndexAnswer>(_updateUserKanaIndexAnswer);
    on<UpdateUserTextAnswer>(_updateUserTextAnswer);
    on<CheckAnswer>(_checkAnswer);
    on<StartStroke>(_startStroke);
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

  FutureOr<void> _beginTest(BeginTest event, Emitter<TestKanaState> emit) {
    _currentKanaType = event.kanaType;
    _useModelHiragana = event.useModelHiragana;
    _useModelKatakana = event.useModelKatakana;
    _useModelKanji = event.useModelKanji;
    _kanjiEntries = event.kanjiEntries;
    _kanjiMeanings = event.kanjiMeanings;
    TestType testType = event.difficultyLevel == DifficultyLevel.high
        ? TestType.values[random.nextInt(TestType.values.length)]
        : TestType.singleAnswer;
    emit(TestKanaDraw(state.stateData.copyWith(
      kanaIndex: _pickKanaIndex(event.kana, testType),
      testType: testType,
      canReportDrawing: false,
      reportBusy: false,
      userStrokes: const [],
      lastDrawingPngBytes: null,
      currentScriptUsesModel: _shouldUseModelForCurrentKana(),
    )));
  }

  FutureOr<void> _setDrawingStarted(
      EnableCheckAnswer event, Emitter<TestKanaState> emit) {
    emit(TestKanaDraw(state.stateData.copyWith(canSubmitAnswer: true)));
  }

  FutureOr<void> _addStroke(AddStroke event, Emitter<TestKanaState> emit) {
    List<PaintStroke> strokes = List.from(state.stateData.strokes);
    strokes.add(event.stroke);
    List<List<Offset>> userStrokes = List.from(state.stateData.userStrokes);
    if (userStrokes.isEmpty) {
      userStrokes = [
        [event.stroke.from, event.stroke.to]
      ];
    } else {
      final current = List<Offset>.from(userStrokes.last);
      current.add(event.stroke.to);
      userStrokes[userStrokes.length - 1] = current;
    }
    emit(UpdatedStrokes(state.stateData.copyWith(
      strokes: strokes,
      userStrokes: userStrokes,
      canReportDrawing: false,
    )));
  }

  FutureOr<void> _clearDrawing(
      ClearDrawing event, Emitter<TestKanaState> emit) {
    emit(UpdatedStrokes(state.stateData.copyWith(
      strokes: [],
      userStrokes: const [],
      canSubmitAnswer: false,
      canReportDrawing: false,
      reportBusy: false,
      lastDrawingPngBytes: null,
      reportPredictedLabel: '',
      reportExpectedLabel: '',
      reportConfidence: 0,
    )));
  }

  FutureOr<void> _resetTest(ResetTest event, Emitter<TestKanaState> emit) {
    emit(TestKanaInitial());
  }

  FutureOr<void> _evaluateImage(
      EvaluateImage event, Emitter<TestKanaState> emit) async {
    if (_currentKanaType == KanaType.kanji && _kanjiEntries.isEmpty) {
      emit(ErrorPredictingHiragana(state.stateData,
          msg: "No kanji data loaded for prediction"));
      return;
    }
    final bool shouldUseModel = _shouldUseModelForCurrentKana();
    if (!shouldUseModel) {
      emit(PredictionInProgress(state.stateData));
      final bool success = await _evaluateStrokeDrawing(
        kanaType: _currentKanaType,
        kanaIndex: state.stateData.kanaIndex,
        userStrokes: state.stateData.userStrokes,
      );
      if (success) {
        emit(HiraganaWritingSuccess(state.stateData.copyWith(
          canReportDrawing: false,
          lastDrawingPngBytes: event.pngBytes,
        )));
      } else {
        emit(HiraganaWritingFail(state.stateData.copyWith(
          canReportDrawing: false,
          lastDrawingPngBytes: event.pngBytes,
        )));
      }
      return;
    }

    final ModelConfig modelConfig = _modelConfigForKanaType();
    await _loadModel(modelConfig);
    emit(PredictionInProgress(state.stateData));

    final List<dynamic>? predictions = await predict(event.image, interpreter!);
    if (predictions == null) {
      emit(ErrorPredictingHiragana(state.stateData,
          msg: "Prediction failed. Try again."));
      return;
    }

    final List<double> p = predictions[0].cast<double>();
    final int predictedIndex = getIndexOfMaxValue(p);
    final double confidence = predictedIndex >= 0 && predictedIndex < p.length
        ? p[predictedIndex]
        : 0;
    final String expected =
        _drawingTargetLabelForIndex(state.stateData.kanaIndex);
    final String predicted = _drawingTargetLabelForIndex(predictedIndex);

    if (predictedIndex == state.stateData.kanaIndex) {
      emit(HiraganaWritingSuccess(state.stateData.copyWith(
        canReportDrawing: false,
        reportBusy: false,
        lastDrawingPngBytes: event.pngBytes,
        reportExpectedLabel: expected,
        reportPredictedLabel: predicted,
        reportConfidence: confidence,
      )));
    } else {
      emit(HiraganaWritingFail(state.stateData.copyWith(
        canReportDrawing: true,
        reportBusy: false,
        lastDrawingPngBytes: event.pngBytes,
        reportExpectedLabel: expected,
        reportPredictedLabel: predicted,
        reportConfidence: confidence,
      )));
    }
  }

  FutureOr<void> _captureImage(
      CaptureImage event, Emitter<TestKanaState> emit) {
    emit(TestKanaCapturing(state.stateData));
  }

  Future<void> saveImage(Uint8List pngBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'myImage.png');
    final file = File(path);
    await file.writeAsBytes(pngBytes);
  }

  FutureOr<void> _nextKana(TestNextKana event, Emitter<TestKanaState> emit) {
    add(ClearDrawing());
    _currentKanaType = event.kanaType;
    _useModelHiragana = event.useModelHiragana;
    _useModelKatakana = event.useModelKatakana;
    _useModelKanji = event.useModelKanji;
    _kanjiEntries = event.kanjiEntries;
    _kanjiMeanings = event.kanjiMeanings;
    TestType testType = event.difficultyLevel == DifficultyLevel.high
        ? TestType.values[random.nextInt(TestType.values.length)]
        : TestType.singleAnswer;
    emit(NextKanaLoaded(state.stateData.copyWith(
      kanaIndex: _pickKanaIndex(event.kana, testType),
      testType: testType,
      canReportDrawing: false,
      reportBusy: false,
      userStrokes: const [],
      lastDrawingPngBytes: null,
      reportPredictedLabel: '',
      reportExpectedLabel: '',
      reportConfidence: 0,
      currentScriptUsesModel: _shouldUseModelForCurrentKana(),
    )));
  }

  FutureOr<void> _updateUserKanaIndexAnswer(
      UpdateUserKanaIndexAnswer event, Emitter<TestKanaState> emit) {
    emit(UserKanaIndexAnswerUpdated(
        state.stateData.copyWith(userAnswerKanaIndex: event.userIndex)));
  }

  FutureOr<void> _updateUserTextAnswer(
      UpdateUserTextAnswer event, Emitter<TestKanaState> emit) {
    emit(UserKanaIndexAnswerUpdated(state.stateData.copyWith(
      userTextAnswer: event.userAnswer,
      canSubmitAnswer: true,
    )));
  }

  FutureOr<void> _checkAnswer(CheckAnswer event, Emitter<TestKanaState> emit) {
    if (event.kanaType == KanaType.kanji) {
      if (event.difficultyLevel == DifficultyLevel.low) {
        if (state.stateData.kanaIndex == state.stateData.userAnswerKanaIndex) {
          emit(KanaSelectedSuccess(state.stateData));
        } else {
          emit(KanaSelectedFail(state.stateData));
        }
        return null;
      }
      final int index = state.stateData.kanaIndex;
      if (index >= 0 && index < _kanjiEntries.length) {
        final String key = _kanjiEntries[index].unicode;
        final List<String> meanings = _kanjiMeanings[key] ?? const [];
        final String answer =
            state.stateData.userTextAnswer.trim().toLowerCase();
        final bool matches =
            meanings.any((meaning) => meaning.trim().toLowerCase() == answer);
        if (matches) {
          emit(KanaSelectedSuccess(state.stateData));
        } else {
          emit(KanaSelectedFail(state.stateData));
        }
      } else {
        emit(KanaSelectedFail(state.stateData));
      }
      return null;
    }
    if ((event.difficultyLevel == DifficultyLevel.low &&
            state.stateData.kanaIndex == state.stateData.userAnswerKanaIndex) ||
        (event.difficultyLevel != DifficultyLevel.low &&
            state.stateData.userTextAnswer ==
                event.kana.values.toList()[state.stateData.kanaIndex])) {
      emit(KanaSelectedSuccess(
        state.stateData,
      ));
    } else {
      emit(KanaSelectedFail(
        state.stateData,
      ));
    }
  }

  FutureOr<void> _startStroke(StartStroke event, Emitter<TestKanaState> emit) {
    final List<List<Offset>> userStrokes =
        List.from(state.stateData.userStrokes)..add([event.point]);
    emit(UpdatedStrokes(state.stateData.copyWith(
      userStrokes: userStrokes,
      canSubmitAnswer: true,
    )));
  }

  FutureOr<void> _toggleKanjiTemplate(
      ToggleKanjiTemplate event, Emitter<TestKanaState> emit) {
    emit(TestKanaDraw(state.stateData.copyWith(
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
      emit(DrawingReportShared(state.stateData.copyWith(reportBusy: false)));
    } catch (e) {
      emit(DrawingReportError(
        state.stateData.copyWith(reportBusy: false),
        msg: e.toString(),
      ));
    }
  }

  // Private functions
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

  int _pickKanaIndex(Map<String, String> kana, TestType testType) {
    if (testType != TestType.drawingTest) {
      if (_currentKanaType == KanaType.kanji) {
        return _kanjiEntries.isEmpty ? 0 : random.nextInt(_kanjiEntries.length);
      }
      return random.nextInt(kana.length);
    }
    if (_currentKanaType == KanaType.kanji) {
      return _kanjiEntries.isEmpty ? 0 : random.nextInt(_kanjiEntries.length);
    }
    if (_currentKanaType == KanaType.katakana) {
      final String target =
          katakanaDrawingLabels[random.nextInt(katakanaDrawingLabels.length)];
      return katakanaModelLabels.indexOf(target);
    }
    return random.nextInt(hiragana.length);
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
      return _kanjiEntries.length;
    }
    return modelConfig.numClasses;
  }

  String _drawingTargetLabelForIndex(int index) {
    if (_currentKanaType == KanaType.kanji) {
      if (index >= 0 && index < _kanjiEntries.length) {
        return _kanjiEntries[index].character;
      }
      return 'unknown';
    }
    if (_currentKanaType == KanaType.katakana) {
      if (index >= 0 && index < katakanaModelLabels.length) {
        final symbol = katakanaModelLabels[index];
        return katakana[symbol] ?? symbol;
      }
      return 'unknown';
    }
    final symbols = hiragana.keys.toList();
    if (index >= 0 && index < symbols.length) {
      final symbol = symbols[index];
      return hiragana[symbol] ?? symbol;
    }
    return 'unknown';
  }

  bool _shouldUseModelForCurrentKana() {
    if (_currentKanaType == KanaType.hiragana) return _useModelHiragana;
    if (_currentKanaType == KanaType.katakana) return _useModelKatakana;
    return _useModelKanji;
  }

  Future<bool> _evaluateStrokeDrawing({
    required KanaType kanaType,
    required int kanaIndex,
    required List<List<Offset>> userStrokes,
  }) async {
    final normalizedUser = _normalizeUserStrokes(userStrokes);
    if (normalizedUser.isEmpty) return false;

    final assetPath = _drawingAssetPathForKana(kanaType, kanaIndex);
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

  String? _drawingAssetPathForKana(KanaType kanaType, int index) {
    if (kanaType == KanaType.kanji) {
      if (index < 0 || index >= _kanjiEntries.length) return null;
      final unicode =
          _kanjiEntries[index].unicode.toUpperCase().padLeft(5, '0');
      return 'assets/svg/kanji/$unicode.svg';
    }

    final String? symbol = kanaType == KanaType.katakana
        ? (index >= 0 && index < katakanaModelLabels.length
            ? katakanaModelLabels[index]
            : null)
        : (index >= 0 && index < hiragana.keys.length
            ? hiragana.keys.elementAt(index)
            : null);
    if (symbol == null || symbol.isEmpty) return null;
    final code = symbol.runes.first.toRadixString(16).padLeft(5, '0');
    if (kanaType == KanaType.katakana) {
      return 'assets/svg/katakana/$code.svg';
    }
    return 'assets/svg/hiragana/$code.svg';
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
