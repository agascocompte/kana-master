part of 'dictionary_bloc.dart';

class DictionaryStateData {
  final List<DictionaryEntry> entries;
  final String currentQuery;
  final String errorMessage;

  DictionaryStateData({
    this.entries = const [],
    this.currentQuery = '',
    this.errorMessage = '',
  });

  DictionaryStateData copyWith({
    List<DictionaryEntry>? entries,
    String? currentQuery,
    String? errorMessage,
  }) {
    return DictionaryStateData(
      entries: entries ?? this.entries,
      currentQuery: currentQuery ?? this.currentQuery,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

abstract class DictionaryState {
  final DictionaryStateData stateData;

  DictionaryState({required this.stateData});
}

class DictionaryInitial extends DictionaryState {
  DictionaryInitial() : super(stateData: DictionaryStateData());
}

class DictionaryLoading extends DictionaryState {
  DictionaryLoading(DictionaryStateData stateData)
      : super(stateData: stateData);
}

class DictionaryResults extends DictionaryState {
  DictionaryResults(DictionaryStateData stateData)
      : super(stateData: stateData);
}

class DictionaryError extends DictionaryState {
  DictionaryError(DictionaryStateData stateData) : super(stateData: stateData);
}
