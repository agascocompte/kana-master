part of 'test_hiragana_bloc.dart';

abstract class TestHiraganaEvent {}

class BeginTest extends TestHiraganaEvent {}

class AddStroke extends TestHiraganaEvent {
  final PaintStroke stroke;
  AddStroke({required this.stroke});
}

class ResetTest extends TestHiraganaEvent {}

class ClearDrawing extends TestHiraganaEvent {}

class EvaluateImage extends TestHiraganaEvent {
  final img.Image image;
  EvaluateImage({required this.image});
}

class CaptureImage extends TestHiraganaEvent {}

class TestNextHiragana extends TestHiraganaEvent {}

class EnableCheckAnswer extends TestHiraganaEvent {}

class CheckAnswer extends TestHiraganaEvent {}

class UpdateUserHiraganaIndexAnswer extends TestHiraganaEvent {
  final int userIndex;

  UpdateUserHiraganaIndexAnswer({required this.userIndex});
}
