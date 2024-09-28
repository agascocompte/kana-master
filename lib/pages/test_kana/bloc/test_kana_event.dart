part of 'test_kana_bloc.dart';

abstract class TestHiraganaEvent {}

class BeginTest extends TestHiraganaEvent {
  final bool isDrawingTestEnabled;
  BeginTest({required this.isDrawingTestEnabled});
}

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

class TestNextKana extends TestHiraganaEvent {
  final bool isDrawingTestEnabled;
  TestNextKana({required this.isDrawingTestEnabled});
}

class EnableCheckAnswer extends TestHiraganaEvent {}

class CheckAnswer extends TestHiraganaEvent {}

class UpdateUserKanaIndexAnswer extends TestHiraganaEvent {
  final int userIndex;

  UpdateUserKanaIndexAnswer({required this.userIndex});
}
