part of 'stats_bloc.dart';

class StatsStateData {
  final int correctHiraganaCount;
  final int incorrectHiraganaCount;
  final Map<DateTime, int> correctDataMap;
  final Map<DateTime, int> incorrectDataMap;
  final bool showBarChart;

  StatsStateData({
    this.correctHiraganaCount = 0,
    this.incorrectHiraganaCount = 0,
    this.correctDataMap = const {},
    this.incorrectDataMap = const {},
    this.showBarChart = true,
  });

  StatsStateData copyWith({
    int? correctHiraganaCount,
    int? incorrectHiraganaCount,
    Map<DateTime, int>? correctDataMap,
    Map<DateTime, int>? incorrectDataMap,
    bool? showBarChart,
  }) {
    return StatsStateData(
      correctHiraganaCount: correctHiraganaCount ?? this.correctHiraganaCount,
      incorrectHiraganaCount:
          incorrectHiraganaCount ?? this.incorrectHiraganaCount,
      correctDataMap: correctDataMap ?? this.correctDataMap,
      incorrectDataMap: incorrectDataMap ?? this.incorrectDataMap,
      showBarChart: showBarChart ?? this.showBarChart,
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
