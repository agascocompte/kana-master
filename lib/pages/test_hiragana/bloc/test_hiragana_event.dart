part of 'test_hiragana_bloc.dart';

abstract class TestHiraganaEvent {}

class BeginTest extends TestHiraganaEvent {}

class AddStroke extends TestHiraganaEvent {
  final PaintStroke stroke;
  AddStroke({required this.stroke});
}
