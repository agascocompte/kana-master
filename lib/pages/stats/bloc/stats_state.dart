part of 'stats_bloc.dart';

class StatsStateData {
  int correctHiraganaCount;
  int incorrectHiraganaCount;

  StatsStateData({
    this.correctHiraganaCount = 0,
    this.incorrectHiraganaCount = 0,
  });

  StatsStateData copyWith({
    int? correctHiraganaCount,
    int? incorrectHiraganaCount,
  }) {
    return StatsStateData(
      correctHiraganaCount: correctHiraganaCount ?? this.correctHiraganaCount,
      incorrectHiraganaCount:
          incorrectHiraganaCount ?? this.incorrectHiraganaCount,
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
