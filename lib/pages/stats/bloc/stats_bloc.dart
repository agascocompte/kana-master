import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/domain/repositories/score_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/stats_summary.dart';

part 'stats_event.dart';
part 'stats_state.dart';

@injectable
class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final ScoreRepository scoreRepository;

  StatsBloc({
    required this.scoreRepository,
  }) : super(StatsInitial()) {
    on<LoadMemoryStats>(_loadMemory);
    on<AddAnswerResult>(_addAnswerResult);
    on<ResetStats>(_resetStats);
    on<StatsKanaTypeChanged>(_updateSelectedType);
  }

  FutureOr<void> _loadMemory(
      LoadMemoryStats event, Emitter<StatsState> emit) async {
    final summaries = <KanaType, StatsSummary>{};
    final correctDataByType = <KanaType, Map<DateTime, int>>{};
    final incorrectDataByType = <KanaType, Map<DateTime, int>>{};
    for (final type in KanaType.values) {
      summaries[type] = await scoreRepository.getSummary(type);
      correctDataByType[type] = await scoreRepository.getCorrectCountsByDate(type);
      incorrectDataByType[type] =
          await scoreRepository.getIncorrectCountsByDate(type);
    }
    KanaType selected = state.stateData.selectedKanaType;
    if ((summaries[selected]?.total ?? 0) == 0) {
      for (final type in KanaType.values) {
        if ((summaries[type]?.total ?? 0) > 0) {
          selected = type;
          break;
        }
      }
    }
    emit(StatsUpdated(state.stateData.copyWith(
      summaries: summaries,
      correctDataByType: correctDataByType,
      incorrectDataByType: incorrectDataByType,
      selectedKanaType: selected,
    )));
  }

  FutureOr<void> _addAnswerResult(
    AddAnswerResult event,
    Emitter<StatsState> emit,
  ) async {
    await scoreRepository.addResponse(
      kanaType: event.kanaType,
      isCorrect: event.isCorrect,
    );
    final summary = await scoreRepository.getSummary(event.kanaType);
    final correctData =
        await scoreRepository.getCorrectCountsByDate(event.kanaType);
    final incorrectData =
        await scoreRepository.getIncorrectCountsByDate(event.kanaType);
    final updatedSummaries =
        Map<KanaType, StatsSummary>.from(state.stateData.summaries);
    final updatedCorrect =
        Map<KanaType, Map<DateTime, int>>.from(state.stateData.correctDataByType);
    final updatedIncorrect = Map<KanaType, Map<DateTime, int>>.from(
        state.stateData.incorrectDataByType);
    updatedSummaries[event.kanaType] = summary;
    updatedCorrect[event.kanaType] = correctData;
    updatedIncorrect[event.kanaType] = incorrectData;
    emit(StatsUpdated(state.stateData.copyWith(
      summaries: updatedSummaries,
      correctDataByType: updatedCorrect,
      incorrectDataByType: updatedIncorrect,
    )));
  }

  FutureOr<void> _resetStats(ResetStats event, Emitter<StatsState> emit) async {
    await scoreRepository.resetCounts();
    emit(StatsUpdated(state.stateData.copyWith(
      summaries: {},
      correctDataByType: {},
      incorrectDataByType: {},
      selectedKanaType: KanaType.hiragana,
    )));
  }

  FutureOr<void> _updateSelectedType(
    StatsKanaTypeChanged event,
    Emitter<StatsState> emit,
  ) {
    emit(StatsUpdated(state.stateData.copyWith(
      selectedKanaType: event.kanaType,
    )));
  }
}
