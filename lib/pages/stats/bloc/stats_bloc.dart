import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/domain/repositories/score_repository.dart';
import 'package:injectable/injectable.dart';

part 'stats_event.dart';
part 'stats_state.dart';

@injectable
class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final ScoreRepository scoreRepository;

  StatsBloc({
    required this.scoreRepository,
  }) : super(StatsInitial()) {
    on<LoadMemoryStats>(_loadMemory);
    on<AddHiraganaSuccess>(_addHiraganaSuccess);
    on<AddHiraganaFail>(_addHiraganaFail);
    on<ResetStats>(_resetStats);
  }

  FutureOr<void> _loadMemory(
      LoadMemoryStats event, Emitter<StatsState> emit) async {
    int correctMemoryCount = await scoreRepository.getCorrectHiraganaCount();
    int incorrectMemoryCount =
        await scoreRepository.getIncorrectHiraganaCount();
    emit(StatsUpdated(state.stateData.copyWith(
        correctHiraganaCount: correctMemoryCount,
        incorrectHiraganaCount: incorrectMemoryCount)));
  }

  FutureOr<void> _addHiraganaSuccess(
      AddHiraganaSuccess event, Emitter<StatsState> emit) async {
    await scoreRepository.incrementCorrectHiraganaCount();
    emit(StatsUpdated(state.stateData.copyWith(
        correctHiraganaCount: state.stateData.correctHiraganaCount + 1)));
  }

  FutureOr<void> _addHiraganaFail(
      AddHiraganaFail event, Emitter<StatsState> emit) async {
    await scoreRepository.incrementIncorrectHiraganaCount();
    emit(StatsUpdated(state.stateData.copyWith(
        incorrectHiraganaCount: state.stateData.incorrectHiraganaCount + 1)));
  }

  FutureOr<void> _resetStats(ResetStats event, Emitter<StatsState> emit) async {
    await scoreRepository.resetCorrectHiraganaCount();
    await scoreRepository.resetIncorrectHiraganaCount();
    emit(StatsUpdated(state.stateData.copyWith(
      correctHiraganaCount: 0,
      incorrectHiraganaCount: 0,
    )));
  }
}
