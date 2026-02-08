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

      final correctRaw = await scoreRepository.getCorrectCountsByDate(type);
      final incorrectRaw = await scoreRepository.getIncorrectCountsByDate(type);

      correctDataByType[type] = _normalizeDayMap(correctRaw);
      incorrectDataByType[type] = _normalizeDayMap(incorrectRaw);
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
    final correctRaw =
        await scoreRepository.getCorrectCountsByDate(event.kanaType);
    final incorrectRaw =
        await scoreRepository.getIncorrectCountsByDate(event.kanaType);
    final updatedSummaries =
        Map<KanaType, StatsSummary>.from(state.stateData.summaries);
    final updatedCorrect = Map<KanaType, Map<DateTime, int>>.from(
        state.stateData.correctDataByType);
    final updatedIncorrect = Map<KanaType, Map<DateTime, int>>.from(
        state.stateData.incorrectDataByType);
    updatedSummaries[event.kanaType] = summary;
    updatedCorrect[event.kanaType] = _normalizeDayMap(correctRaw);
    updatedIncorrect[event.kanaType] = _normalizeDayMap(incorrectRaw);
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

DateTime _dayKey(DateTime d) => DateTime(d.year, d.month, d.day);

Map<DateTime, int> _normalizeDayMap(Map<DateTime, int> src) {
  final out = <DateTime, int>{};
  for (final e in src.entries) {
    final k = _dayKey(e.key);
    out[k] = (out[k] ?? 0) + e.value;
  }
  return out;
}
