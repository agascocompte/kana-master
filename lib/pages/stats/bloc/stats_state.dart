part of 'stats_bloc.dart';

class StatsStateData {
  final Map<KanaType, StatsSummary> summaries;
  final Map<KanaType, Map<DateTime, int>> correctDataByType;
  final Map<KanaType, Map<DateTime, int>> incorrectDataByType;
  final KanaType selectedKanaType;

  StatsStateData({
    this.summaries = const {},
    this.correctDataByType = const {},
    this.incorrectDataByType = const {},
    this.selectedKanaType = KanaType.hiragana,
  });

  StatsStateData copyWith({
    Map<KanaType, StatsSummary>? summaries,
    Map<KanaType, Map<DateTime, int>>? correctDataByType,
    Map<KanaType, Map<DateTime, int>>? incorrectDataByType,
    KanaType? selectedKanaType,
  }) {
    return StatsStateData(
      summaries: summaries ?? this.summaries,
      correctDataByType: correctDataByType ?? this.correctDataByType,
      incorrectDataByType: incorrectDataByType ?? this.incorrectDataByType,
      selectedKanaType: selectedKanaType ?? this.selectedKanaType,
    );
  }
}

abstract class StatsState {
  final StatsStateData stateData;

  StatsState({required this.stateData});
}

class StatsInitial extends StatsState {
  StatsInitial() : super(stateData: StatsStateData());
}

class StatsUpdated extends StatsState {
  StatsUpdated(StatsStateData stateData) : super(stateData: stateData);
}
