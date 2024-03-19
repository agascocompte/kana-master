import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:injectable/injectable.dart';

part 'test_hiragana_event.dart';
part 'test_hiragana_state.dart';

@injectable
class TestHiraganaBloc extends Bloc<TestHiraganaEvent, TestHiraganaState> {
  TestHiraganaBloc() : super(TestHiraganaInitial()) {
    on<BeginTest>(_beginTest);
  }

  FutureOr<void> _beginTest(BeginTest event, Emitter<TestHiraganaState> emit) {
    final random = math.Random();
    int index = random.nextInt(hiraganas.length);
    emit(TestHiraganaDraw(state.stateData.copyWith(hiraganaIndex: index)));
  }
}
