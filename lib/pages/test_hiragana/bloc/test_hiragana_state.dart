part of 'test_hiragana_bloc.dart';

class TestHiraganaStateData {
  int hiraganaIndex;
  List<PaintStroke> strokes;

  TestHiraganaStateData({
    this.strokes = const [],
    this.hiraganaIndex = 0,
  });

  TestHiraganaStateData copyWith({
    List<PaintStroke>? strokes,
    int? hiraganaIndex,
    int? correctCount,
    int? incorrectCount,
  }) {
    return TestHiraganaStateData(
      strokes: strokes ?? this.strokes,
      hiraganaIndex: hiraganaIndex ?? this.hiraganaIndex,
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
  final String msg;
  HiraganaWritingSuccess(TestHiraganaStateData stateData, {required this.msg})
      : super(stateData: stateData);
}

class HiraganaWritingFail extends TestHiraganaState {
  final String msg;
  HiraganaWritingFail(TestHiraganaStateData stateData, {required this.msg})
      : super(stateData: stateData);
}

class NextHiraganaLoaded extends TestHiraganaState {
  NextHiraganaLoaded(TestHiraganaStateData stateData)
      : super(stateData: stateData);
}
