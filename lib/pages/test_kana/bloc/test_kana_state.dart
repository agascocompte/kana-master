part of 'test_kana_bloc.dart';

enum QuestionPhase { answering, revealed }

/// Progress of the current practice session.
class TestSession {
  final KanaType kanaType;
  final DifficultyLevel difficulty;
  final TestType testType;
  final List<QuizItem> pool;
  final int length;
  final bool isReview;

  /// 1-based number of the current question.
  final int questionNumber;
  final int correctCount;
  final List<QuizItem> mistakes;
  final QuizItem? current;

  /// Options for single choice questions.
  final List<QuizItem> options;
  final bool finished;

  const TestSession({
    required this.kanaType,
    required this.difficulty,
    required this.testType,
    required this.pool,
    required this.length,
    this.isReview = false,
    this.questionNumber = 0,
    this.correctCount = 0,
    this.mistakes = const [],
    this.current,
    this.options = const [],
    this.finished = false,
  });

  int get answeredCount => correctCount + mistakes.length;

  TestSession copyWith({
    int? questionNumber,
    int? correctCount,
    List<QuizItem>? mistakes,
    QuizItem? current,
    List<QuizItem>? options,
    bool? finished,
  }) {
    return TestSession(
      kanaType: kanaType,
      difficulty: difficulty,
      testType: testType,
      pool: pool,
      length: length,
      isReview: isReview,
      questionNumber: questionNumber ?? this.questionNumber,
      correctCount: correctCount ?? this.correctCount,
      mistakes: mistakes ?? this.mistakes,
      current: current ?? this.current,
      options: options ?? this.options,
      finished: finished ?? this.finished,
    );
  }
}

class TestKanaStateData {
  final TestSession? session;
  final QuestionPhase phase;
  final QuizItem? selectedOption;
  final String userTextAnswer;
  final List<PaintStroke> strokes;
  final List<List<Offset>> userStrokes;
  final bool canSubmitAnswer;
  final bool canReportDrawing;
  final bool reportBusy;
  final List<int>? lastDrawingPngBytes;
  final String reportExpectedLabel;
  final String reportPredictedLabel;
  final double reportConfidence;
  final bool showKanjiTemplate;
  final bool currentScriptUsesModel;

  TestKanaStateData({
    this.session,
    this.phase = QuestionPhase.answering,
    this.selectedOption,
    this.userTextAnswer = '',
    this.strokes = const [],
    this.userStrokes = const [],
    this.canSubmitAnswer = false,
    this.canReportDrawing = false,
    this.reportBusy = false,
    this.lastDrawingPngBytes,
    this.reportExpectedLabel = '',
    this.reportPredictedLabel = '',
    this.reportConfidence = 0,
    this.showKanjiTemplate = false,
    this.currentScriptUsesModel = true,
  });

  QuizItem? get current => session?.current;
  TestType get testType => session?.testType ?? TestType.singleAnswer;
  bool get revealed => phase == QuestionPhase.revealed;

  TestKanaStateData copyWith({
    TestSession? session,
    QuestionPhase? phase,
    QuizItem? selectedOption,
    bool clearSelectedOption = false,
    String? userTextAnswer,
    List<PaintStroke>? strokes,
    List<List<Offset>>? userStrokes,
    bool? canSubmitAnswer,
    bool? canReportDrawing,
    bool? reportBusy,
    List<int>? lastDrawingPngBytes,
    bool clearLastDrawing = false,
    String? reportExpectedLabel,
    String? reportPredictedLabel,
    double? reportConfidence,
    bool? showKanjiTemplate,
    bool? currentScriptUsesModel,
  }) {
    return TestKanaStateData(
      session: session ?? this.session,
      phase: phase ?? this.phase,
      selectedOption:
          clearSelectedOption ? null : selectedOption ?? this.selectedOption,
      userTextAnswer: userTextAnswer ?? this.userTextAnswer,
      strokes: strokes ?? this.strokes,
      userStrokes: userStrokes ?? this.userStrokes,
      canSubmitAnswer: canSubmitAnswer ?? this.canSubmitAnswer,
      canReportDrawing: canReportDrawing ?? this.canReportDrawing,
      reportBusy: reportBusy ?? this.reportBusy,
      lastDrawingPngBytes: clearLastDrawing
          ? null
          : lastDrawingPngBytes ?? this.lastDrawingPngBytes,
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

/// A new question is ready to be answered.
class QuestionReady extends TestKanaState {
  QuestionReady(TestKanaStateData stateData) : super(stateData: stateData);
}

/// The user changed their answer (option, text or drawing).
class AnswerChanged extends TestKanaState {
  AnswerChanged(TestKanaStateData stateData) : super(stateData: stateData);
}

class TestKanaCapturing extends TestKanaState {
  TestKanaCapturing(TestKanaStateData stateData) : super(stateData: stateData);
}

class PredictionInProgress extends TestKanaState {
  PredictionInProgress(TestKanaStateData stateData)
      : super(stateData: stateData);
}

class ErrorPredicting extends TestKanaState {
  final String msg;

  ErrorPredicting(TestKanaStateData stateData, {required this.msg})
      : super(stateData: stateData);
}

/// Emitted once per answered question so listeners can record stats.
abstract class AnswerResult extends TestKanaState {
  final QuizItem item;
  final bool isCorrect;

  AnswerResult(TestKanaStateData stateData,
      {required this.item, required this.isCorrect})
      : super(stateData: stateData);
}

class AnswerCorrect extends AnswerResult {
  AnswerCorrect(super.stateData, {required super.item})
      : super(isCorrect: true);
}

/// Wrong answer: the correct one is revealed until the user moves on.
class AnswerWrong extends AnswerResult {
  AnswerWrong(super.stateData, {required super.item})
      : super(isCorrect: false);
}

class SessionFinished extends TestKanaState {
  SessionFinished(TestKanaStateData stateData) : super(stateData: stateData);
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
