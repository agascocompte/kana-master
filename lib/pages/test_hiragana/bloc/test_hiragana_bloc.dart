import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/domain/models/paint_stroke.dart';
import 'package:injectable/injectable.dart';

part 'test_hiragana_event.dart';
part 'test_hiragana_state.dart';

@injectable
class TestHiraganaBloc extends Bloc<TestHiraganaEvent, TestHiraganaState> {
  TestHiraganaBloc() : super(TestHiraganaInitial()) {
    on<BeginTest>(_beginTest);
    on<AddStroke>(_addStroke);
  }

  FutureOr<void> _beginTest(BeginTest event, Emitter<TestHiraganaState> emit) {
    final random = math.Random();
    emit(TestHiraganaDraw(state.stateData.copyWith(
      hiraganaIndex: random.nextInt(hiraganas.length),
      strokes: [],
    )));
  }

  FutureOr<void> _addStroke(AddStroke event, Emitter<TestHiraganaState> emit) {
    List<PaintStroke> strokes = List.from(state.stateData.strokes);
    strokes.add(event.stroke);
    emit(UpdatedStrokes(state.stateData.copyWith(strokes: strokes)));
  }
}
