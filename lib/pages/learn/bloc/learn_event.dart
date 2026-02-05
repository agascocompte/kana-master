part of 'learn_bloc.dart';

abstract class LearnEvent {}

class LearnInitialized extends LearnEvent {
  final KanaType kanaType;
  final String languageCode;
  final String jlptFilter;

  LearnInitialized({
    required this.kanaType,
    required this.languageCode,
    required this.jlptFilter,
  });
}

class LearnQueryChanged extends LearnEvent {
  final String query;

  LearnQueryChanged(this.query);
}

class LearnJlptFilterChanged extends LearnEvent {
  final String filter;

  LearnJlptFilterChanged(this.filter);
}
