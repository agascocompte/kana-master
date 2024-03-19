part of 'test_hiragana_bloc.dart';

abstract class TestHiraganaEvent {}

class BeginTest extends TestHiraganaEvent {}

class AddStroke extends TestHiraganaEvent {
  final PaintStroke stroke;
  AddStroke({required this.stroke});
}

class ClearDrawing extends TestHiraganaEvent {}

class EvaluateImage extends TestHiraganaEvent {
  final img.Image image;
  EvaluateImage({required this.image});
}

class CaptureImage extends TestHiraganaEvent {}
