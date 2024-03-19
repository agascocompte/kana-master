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
