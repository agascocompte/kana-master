part of 'test_kana_bloc.dart';

class TestKanaStateData {
  int kanaIndex;
  List<PaintStroke> strokes;
  bool canSubmitAnswer;
  TestType testType;
  int userAnswerKanaIndex;

  TestKanaStateData({
    this.strokes = const [],
    this.kanaIndex = 0,
    this.canSubmitAnswer = false,
    this.testType = TestType.drawingTest,
    this.userAnswerKanaIndex = 0,
  });

  TestKanaStateData copyWith({
    List<PaintStroke>? strokes,
    int? kanaIndex,
    bool? canSubmitAnswer,
    TestType? testType,
    int? userAnswerKanaIndex,
  }) {
    return TestKanaStateData(
      strokes: strokes ?? this.strokes,
      kanaIndex: kanaIndex ?? this.kanaIndex,
      canSubmitAnswer: canSubmitAnswer ?? this.canSubmitAnswer,
      testType: testType ?? this.testType,
      userAnswerKanaIndex: userAnswerKanaIndex ?? this.userAnswerKanaIndex,
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
