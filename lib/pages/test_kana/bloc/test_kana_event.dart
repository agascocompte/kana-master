part of 'test_kana_bloc.dart';

abstract class TestKanaEvent {}

class StartSession extends TestKanaEvent {
  final KanaType kanaType;
  final DifficultyLevel difficulty;
  final List<QuizItem> pool;
  final int length;
  final bool useModel;

  /// Symbol for each class of the drawing model, in class order.
  final List<String> modelLabels;

  /// Known answer history, used to weight the questions.
  final Map<String, ItemStat> stats;
  final bool isReview;

  StartSession({
    required this.kanaType,
    required this.difficulty,
    required this.pool,
    required this.length,
    required this.useModel,
    this.modelLabels = const [],
    this.stats = const {},
    this.isReview = false,
  });
}

/// Starts a new session with the mistakes of the finished one.
class ReviewMistakes extends TestKanaEvent {}

/// Starts a new session with the same settings as the finished one.
class RestartSession extends TestKanaEvent {}

class OptionSelected extends TestKanaEvent {
  final QuizItem option;

  OptionSelected(this.option);
}

class UpdateUserTextAnswer extends TestKanaEvent {
  final String userAnswer;

  UpdateUserTextAnswer({required this.userAnswer});
}

/// Checks a single choice or typed answer.
class SubmitAnswer extends TestKanaEvent {}

/// Moves on after a revealed mistake.
class NextQuestion extends TestKanaEvent {}

class ResetTest extends TestKanaEvent {}

class EnableCheckAnswer extends TestKanaEvent {}

class AddStroke extends TestKanaEvent {
  final PaintStroke stroke;

  AddStroke({required this.stroke});
}

class StartStroke extends TestKanaEvent {
  final Offset point;

  StartStroke({required this.point});
}

class ClearDrawing extends TestKanaEvent {}

class CaptureImage extends TestKanaEvent {}

class EvaluateImage extends TestKanaEvent {
  final img.Image image;
  final Uint8List pngBytes;

  EvaluateImage({required this.image, required this.pngBytes});
}

class ToggleKanjiTemplate extends TestKanaEvent {}

class ReportDrawingFalseNegative extends TestKanaEvent {}
