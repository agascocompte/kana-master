part of 'test_hiragana_bloc.dart';

class TestHiraganaStateData {
  int hiraganaIndex;
  List<PaintStroke> strokes;
  bool canSubmitAnswer;
  TestType testType;
  int userAnswerHiraganaIndex;

  TestHiraganaStateData({
    this.strokes = const [],
    this.hiraganaIndex = 0,
    this.canSubmitAnswer = false,
    this.testType = TestType.drawingTest,
    this.userAnswerHiraganaIndex = 0,
  });

  TestHiraganaStateData copyWith({
    List<PaintStroke>? strokes,
    int? hiraganaIndex,
    bool? canSubmitAnswer,
    TestType? testType,
    int? userAnswerHiraganaIndex,
  }) {
    return TestHiraganaStateData(
      strokes: strokes ?? this.strokes,
      hiraganaIndex: hiraganaIndex ?? this.hiraganaIndex,
      canSubmitAnswer: canSubmitAnswer ?? this.canSubmitAnswer,
      testType: testType ?? this.testType,
      userAnswerHiraganaIndex:
          userAnswerHiraganaIndex ?? this.userAnswerHiraganaIndex,
    );
  }
}

abstract class TestHiraganaState {
  final TestHiraganaStateData stateData;

  TestHiraganaState({required this.stateData});
}

class TestHiraganaInitial extends TestHiraganaState {
  TestHiraganaInitial() : super(stateData: TestHiraganaStateData());
}

class TestHiraganaLoadedScores extends TestHiraganaState {
  TestHiraganaLoadedScores(TestHiraganaStateData stateData)
      : super(stateData: stateData);
}

class TestHiraganaDraw extends TestHiraganaState {
  TestHiraganaDraw(TestHiraganaStateData stateData)
      : super(stateData: stateData);
}

class TestHiraganaEvaluation extends TestHiraganaState {
  TestHiraganaEvaluation() : super(stateData: TestHiraganaStateData());
}

class UpdatedStrokes extends TestHiraganaState {
  UpdatedStrokes(TestHiraganaStateData stateData) : super(stateData: stateData);
}

class TestHiraganaCapturing extends TestHiraganaState {
  TestHiraganaCapturing(TestHiraganaStateData stateData)
      : super(stateData: stateData);
}

class ErrorPredictingHiragana extends TestHiraganaState {
  final String msg;
  ErrorPredictingHiragana(TestHiraganaStateData stateData, {required this.msg})
      : super(stateData: stateData);
}

class HiraganaWritingSuccess extends TestHiraganaState {
  HiraganaWritingSuccess(
    TestHiraganaStateData stateData,
  ) : super(stateData: stateData);
}

class HiraganaWritingFail extends TestHiraganaState {
  HiraganaWritingFail(
    TestHiraganaStateData stateData,
  ) : super(stateData: stateData);
}

class NextHiraganaLoaded extends TestHiraganaState {
  NextHiraganaLoaded(TestHiraganaStateData stateData)
      : super(stateData: stateData);
}

class UserHiraganaIndexAnswerUpdated extends TestHiraganaState {
  UserHiraganaIndexAnswerUpdated(TestHiraganaStateData stateData)
      : super(stateData: stateData);
}

class HiraganaSelectedSuccess extends TestHiraganaState {
  HiraganaSelectedSuccess(
    TestHiraganaStateData stateData,
  ) : super(stateData: stateData);
}

class HiraganaSelectedFail extends TestHiraganaState {
  HiraganaSelectedFail(
    TestHiraganaStateData stateData,
  ) : super(stateData: stateData);
}

class PredictionInProgress extends TestHiraganaState {
  PredictionInProgress(TestHiraganaStateData stateData)
      : super(stateData: stateData);
}
