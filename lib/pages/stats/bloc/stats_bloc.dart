import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/domain/repositories/score_repository.dart';
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
    on<StatsViewChanged>(_updateView);
  }

  FutureOr<void> _loadMemory(
      LoadMemoryStats event, Emitter<StatsState> emit) async {
    int correctMemoryCount = await scoreRepository.getCorrectHiraganaCount();
    int incorrectMemoryCount =
        await scoreRepository.getIncorrectHiraganaCount();
    Map<DateTime, int> correctDataMap =
        await scoreRepository.getCorrectHiraganaCountsByDate();
    Map<DateTime, int> incorrectDataMap =
        await scoreRepository.getIncorrectHiraganaCountsByDate();

    emit(StatsUpdated(state.stateData.copyWith(
      correctHiraganaCount: correctMemoryCount,
      incorrectHiraganaCount: incorrectMemoryCount,
      correctDataMap: correctDataMap,
      incorrectDataMap: incorrectDataMap,
    )));
  }

  FutureOr<void> _addHiraganaSuccess(
      AddHiraganaSuccess event, Emitter<StatsState> emit) async {
    await scoreRepository.incrementCorrectHiraganaCount();

    Map<DateTime, int> updatedCorrectDataMap =
        await scoreRepository.getCorrectHiraganaCountsByDate();

    emit(StatsUpdated(state.stateData.copyWith(
        correctHiraganaCount: state.stateData.correctHiraganaCount + 1,
        correctDataMap: updatedCorrectDataMap)));
  }

  FutureOr<void> _addHiraganaFail(
      AddHiraganaFail event, Emitter<StatsState> emit) async {
    await scoreRepository.incrementIncorrectHiraganaCount();

    Map<DateTime, int> updatedIncorrectDataMap =
        await scoreRepository.getIncorrectHiraganaCountsByDate();

    emit(StatsUpdated(state.stateData.copyWith(
      incorrectHiraganaCount: state.stateData.incorrectHiraganaCount + 1,
      incorrectDataMap: updatedIncorrectDataMap,
    )));
  }

  FutureOr<void> _resetStats(ResetStats event, Emitter<StatsState> emit) async {
    await scoreRepository.resetHiraganaCounts();
    emit(StatsUpdated(state.stateData.copyWith(
      correctHiraganaCount: 0,
      incorrectHiraganaCount: 0,
      correctDataMap: {},
      incorrectDataMap: {},
    )));
  }

  FutureOr<void> _updateView(
    StatsViewChanged event,
    Emitter<StatsState> emit,
  ) {
    emit(StatsUpdated(state.stateData.copyWith(
      showBarChart: event.showBarChart,
    )));
  }
}
