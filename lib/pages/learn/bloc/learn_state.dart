part of 'learn_bloc.dart';

class LearnStateData {
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;
  final List<KanjiEntry> filteredKanjiEntries;
  final Map<String, List<String>> kanjiMeanings;
  final String query;
  final String jlptFilter;
  final String errorMessage;

  LearnStateData({
    this.kanaType = KanaType.hiragana,
    this.kanjiEntries = const [],
    this.filteredKanjiEntries = const [],
    this.kanjiMeanings = const {},
    this.query = '',
    this.jlptFilter = 'all',
    this.errorMessage = '',
  });

  LearnStateData copyWith({
    KanaType? kanaType,
    List<KanjiEntry>? kanjiEntries,
    List<KanjiEntry>? filteredKanjiEntries,
    Map<String, List<String>>? kanjiMeanings,
    String? query,
    String? jlptFilter,
    String? errorMessage,
  }) {
    return LearnStateData(
      kanaType: kanaType ?? this.kanaType,
      kanjiEntries: kanjiEntries ?? this.kanjiEntries,
      filteredKanjiEntries: filteredKanjiEntries ?? this.filteredKanjiEntries,
      kanjiMeanings: kanjiMeanings ?? this.kanjiMeanings,
      query: query ?? this.query,
      jlptFilter: jlptFilter ?? this.jlptFilter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

abstract class LearnState {
  final LearnStateData stateData;

  LearnState({required this.stateData});
}

class LearnInitial extends LearnState {
  LearnInitial() : super(stateData: LearnStateData());
}

class LearnLoading extends LearnState {
  LearnLoading(LearnStateData stateData) : super(stateData: stateData);
}

class LearnLoaded extends LearnState {
  LearnLoaded(LearnStateData stateData) : super(stateData: stateData);
}

class LearnError extends LearnState {
  LearnError(LearnStateData stateData) : super(stateData: stateData);
}
