part of 'test_kana_bloc.dart';

abstract class TestKanaEvent {}

class BeginTest extends TestKanaEvent {
  final Map<String, String> kana;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;
  final DifficultyLevel difficultyLevel;
  BeginTest({
    required this.kana,
    required this.kanaType,
    this.kanjiEntries = const [],
    required this.difficultyLevel,
  });
}

class AddStroke extends TestKanaEvent {
  final PaintStroke stroke;
  AddStroke({required this.stroke});
}

class ResetTest extends TestKanaEvent {}

class ClearDrawing extends TestKanaEvent {}

class EvaluateImage extends TestKanaEvent {
  final img.Image image;
  EvaluateImage({required this.image});
}

class CaptureImage extends TestKanaEvent {}

class TestNextKana extends TestKanaEvent {
  final Map<String, String> kana;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;
  final DifficultyLevel difficultyLevel;
  TestNextKana({
    required this.kana,
    required this.kanaType,
    this.kanjiEntries = const [],
    required this.difficultyLevel,
  });
}

class EnableCheckAnswer extends TestKanaEvent {}

class CheckAnswer extends TestKanaEvent {
  final KanaType kanaType;
  final DifficultyLevel difficultyLevel;
  final Map<String, String> kana;

  CheckAnswer({
    required this.kanaType,
    required this.difficultyLevel,
    required this.kana,
  });
}

class UpdateUserKanaIndexAnswer extends TestKanaEvent {
  final int userIndex;

  UpdateUserKanaIndexAnswer({required this.userIndex});
}

class UpdateUserTextAnswer extends TestKanaEvent {
  final String userAnswer;

  UpdateUserTextAnswer({required this.userAnswer});
}
