part of 'dictionary_bloc.dart';

abstract class DictionaryEvent {}

class SearchSubmitted extends DictionaryEvent {
  final String query;

  SearchSubmitted(this.query);
}

class DictionaryQueryChanged extends DictionaryEvent {
  final String query;

  DictionaryQueryChanged(this.query);
}

class ClearSearch extends DictionaryEvent {}
