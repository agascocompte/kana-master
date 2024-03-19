part of 'test_hiragana_bloc.dart';

class TestHiraganaStateData {
  int hiraganaIndex;

  TestHiraganaStateData({
    this.hiraganaIndex = 0,
  });

  TestHiraganaStateData copyWith({
    int? hiraganaIndex,
  }) {
    return TestHiraganaStateData(
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
