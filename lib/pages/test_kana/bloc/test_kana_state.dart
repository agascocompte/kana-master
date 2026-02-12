part of 'test_kana_bloc.dart';

class TestKanaStateData {
  final int kanaIndex;
  final List<PaintStroke> strokes;
  final List<List<Offset>> userStrokes;
  final bool canSubmitAnswer;
  final TestType testType;
  final int userAnswerKanaIndex;
  final String userTextAnswer;
  final bool canReportDrawing;
  final bool reportBusy;
  final List<int>? lastDrawingPngBytes;
  final String reportExpectedLabel;
  final String reportPredictedLabel;
  final double reportConfidence;
  final bool showKanjiTemplate;
  final bool currentScriptUsesModel;

  TestKanaStateData({
    this.strokes = const [],
    this.userStrokes = const [],
    this.kanaIndex = 0,
    this.canSubmitAnswer = false,
    this.testType = TestType.drawingTest,
    this.userAnswerKanaIndex = 0,
    this.userTextAnswer = '',
    this.canReportDrawing = false,
    this.reportBusy = false,
    this.lastDrawingPngBytes,
    this.reportExpectedLabel = '',
    this.reportPredictedLabel = '',
    this.reportConfidence = 0,
    this.showKanjiTemplate = false,
    this.currentScriptUsesModel = true,
  });

  TestKanaStateData copyWith({
    List<PaintStroke>? strokes,
    List<List<Offset>>? userStrokes,
    int? kanaIndex,
    bool? canSubmitAnswer,
    TestType? testType,
    int? userAnswerKanaIndex,
    String? userTextAnswer,
    bool? canReportDrawing,
    bool? reportBusy,
    List<int>? lastDrawingPngBytes,
    String? reportExpectedLabel,
    String? reportPredictedLabel,
    double? reportConfidence,
    bool? showKanjiTemplate,
    bool? currentScriptUsesModel,
  }) {
    return TestKanaStateData(
      strokes: strokes ?? this.strokes,
      userStrokes: userStrokes ?? this.userStrokes,
      kanaIndex: kanaIndex ?? this.kanaIndex,
      canSubmitAnswer: canSubmitAnswer ?? this.canSubmitAnswer,
      testType: testType ?? this.testType,
      userAnswerKanaIndex: userAnswerKanaIndex ?? this.userAnswerKanaIndex,
      userTextAnswer: userTextAnswer ?? this.userTextAnswer,
      canReportDrawing: canReportDrawing ?? this.canReportDrawing,
      reportBusy: reportBusy ?? this.reportBusy,
      lastDrawingPngBytes: lastDrawingPngBytes ?? this.lastDrawingPngBytes,
      reportExpectedLabel: reportExpectedLabel ?? this.reportExpectedLabel,
      reportPredictedLabel: reportPredictedLabel ?? this.reportPredictedLabel,
      reportConfidence: reportConfidence ?? this.reportConfidence,
      showKanjiTemplate: showKanjiTemplate ?? this.showKanjiTemplate,
      currentScriptUsesModel:
          currentScriptUsesModel ?? this.currentScriptUsesModel,
    );
  }
}

abstract class TestKanaState {
  final TestKanaStateData stateData;

  TestKanaState({required this.stateData});
}

class TestKanaInitial extends TestKanaState {
  TestKanaInitial() : super(stateData: TestKanaStateData());
}

class TestKanaLoadedScores extends TestKanaState {
  TestKanaLoadedScores(TestKanaStateData stateData)
      : super(stateData: stateData);
}

class TestKanaDraw extends TestKanaState {
  TestKanaDraw(TestKanaStateData stateData) : super(stateData: stateData);
}

class TestKanaEvaluation extends TestKanaState {
  TestKanaEvaluation() : super(stateData: TestKanaStateData());
}

class UpdatedStrokes extends TestKanaState {
  UpdatedStrokes(TestKanaStateData stateData) : super(stateData: stateData);
}

class TestKanaCapturing extends TestKanaState {
  TestKanaCapturing(TestKanaStateData stateData) : super(stateData: stateData);
}

class ErrorPredictingHiragana extends TestKanaState {
  final String msg;
  ErrorPredictingHiragana(TestKanaStateData stateData, {required this.msg})
      : super(stateData: stateData);
}

class HiraganaWritingSuccess extends TestKanaState {
  HiraganaWritingSuccess(
    TestKanaStateData stateData,
  ) : super(stateData: stateData);
}

class HiraganaWritingFail extends TestKanaState {
  HiraganaWritingFail(
    TestKanaStateData stateData,
  ) : super(stateData: stateData);
}

class NextKanaLoaded extends TestKanaState {
  NextKanaLoaded(TestKanaStateData stateData) : super(stateData: stateData);
}

class UserKanaIndexAnswerUpdated extends TestKanaState {
  UserKanaIndexAnswerUpdated(TestKanaStateData stateData)
      : super(stateData: stateData);
}

class KanaSelectedSuccess extends TestKanaState {
  KanaSelectedSuccess(
    TestKanaStateData stateData,
  ) : super(stateData: stateData);
}

class KanaSelectedFail extends TestKanaState {
  KanaSelectedFail(
    TestKanaStateData stateData,
  ) : super(stateData: stateData);
}

class PredictionInProgress extends TestKanaState {
  PredictionInProgress(TestKanaStateData stateData)
      : super(stateData: stateData);
}

class DrawingReportInProgress extends TestKanaState {
  DrawingReportInProgress(TestKanaStateData stateData)
      : super(stateData: stateData);
}

class DrawingReportShared extends TestKanaState {
  DrawingReportShared(TestKanaStateData stateData) : super(stateData: stateData);
}

class DrawingReportError extends TestKanaState {
  final String msg;
  DrawingReportError(TestKanaStateData stateData, {required this.msg})
      : super(stateData: stateData);
}
