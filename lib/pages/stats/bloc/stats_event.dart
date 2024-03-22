part of 'stats_bloc.dart';

abstract class StatsEvent {}

class LoadMemoryStats extends StatsEvent {}

class AddHiraganaSuccess extends StatsEvent {}

class AddHiraganaFail extends StatsEvent {}
