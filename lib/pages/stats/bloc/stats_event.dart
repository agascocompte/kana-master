part of 'stats_bloc.dart';

abstract class StatsEvent {}

class LoadMemoryStats extends StatsEvent {}

class AddAnswerResult extends StatsEvent {
  final KanaType kanaType;
  final bool isCorrect;
  final String? item;

  AddAnswerResult({
    required this.kanaType,
    required this.isCorrect,
    this.item,
  });
}

class ResetStats extends StatsEvent {}

class StatsKanaTypeChanged extends StatsEvent {
  final KanaType kanaType;

  StatsKanaTypeChanged(this.kanaType);
}
