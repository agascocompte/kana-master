part of 'test_kana_bloc.dart';

abstract class TestKanaEvent {}

class BeginTest extends TestKanaEvent {
  final Map<String, String> kana;
  final bool isDrawingTestEnabled;
  BeginTest({
    required this.kana,
    required this.isDrawingTestEnabled,
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
  final bool isDrawingTestEnabled;
  TestNextKana({
    required this.kana,
    required this.isDrawingTestEnabled,
  });
}

class EnableCheckAnswer extends TestKanaEvent {}

class CheckAnswer extends TestKanaEvent {}

class UpdateUserKanaIndexAnswer extends TestKanaEvent {
  final int userIndex;

  UpdateUserKanaIndexAnswer({required this.userIndex});
}
