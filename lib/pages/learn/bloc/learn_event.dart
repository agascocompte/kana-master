part of 'learn_bloc.dart';

abstract class LearnEvent {}

class LearnInitialized extends LearnEvent {
  final KanaType kanaType;
  final String languageCode;

  LearnInitialized({
    required this.kanaType,
    required this.languageCode,
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
