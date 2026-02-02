import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/domain/usecases/ensure_kanji_imported.dart';
import 'package:kana_master/domain/usecases/get_kanji_entries.dart';
import 'package:kana_master/domain/usecases/get_kanji_meanings.dart';

part 'learn_event.dart';
part 'learn_state.dart';

@injectable
class LearnBloc extends Bloc<LearnEvent, LearnState> {
  final EnsureKanjiImported ensureKanjiImported;
  final GetKanjiEntries getKanjiEntries;
  final GetKanjiMeanings getKanjiMeanings;

  LearnBloc({
    required this.ensureKanjiImported,
    required this.getKanjiEntries,
    required this.getKanjiMeanings,
  }) : super(LearnInitial()) {
    on<LearnInitialized>(_initialize);
    on<LearnQueryChanged>(_updateQuery);
    on<LearnJlptFilterChanged>(_updateJlptFilter);
  }

  Future<void> _initialize(
    LearnInitialized event,
    Emitter<LearnState> emit,
  ) async {
    final LearnStateData baseData = state.stateData.copyWith(
      kanaType: event.kanaType,
      query: '',
      jlptFilter: 'all',
      errorMessage: '',
      kanjiEntries: const [],
      filteredKanjiEntries: const [],
      kanjiMeanings: const {},
    );
    emit(LearnLoading(baseData));
    if (event.kanaType != KanaType.kanji) {
      emit(LearnLoaded(baseData));
      return;
    }
    try {
      await ensureKanjiImported();
      final entries = await getKanjiEntries();
      final meanings = await getKanjiMeanings(event.languageCode);
      final filtered = _filterKanji(
        entries: entries,
        meanings: meanings,
        query: baseData.query,
        jlptFilter: baseData.jlptFilter,
      );
      emit(LearnLoaded(baseData.copyWith(
        kanjiEntries: entries,
        kanjiMeanings: meanings,
        filteredKanjiEntries: filtered,
      )));
    } catch (e) {
      emit(LearnError(baseData.copyWith(errorMessage: e.toString())));
    }
  }

  FutureOr<void> _updateQuery(
    LearnQueryChanged event,
    Emitter<LearnState> emit,
  ) {
    if (state.stateData.kanaType != KanaType.kanji) {
      emit(LearnLoaded(state.stateData.copyWith(query: event.query)));
      return null;
    }
    final updated = state.stateData.copyWith(query: event.query);
    emit(LearnLoaded(updated.copyWith(
      filteredKanjiEntries: _filterKanji(
        entries: updated.kanjiEntries,
        meanings: updated.kanjiMeanings,
        query: updated.query,
        jlptFilter: updated.jlptFilter,
      ),
    )));
  }

  FutureOr<void> _updateJlptFilter(
    LearnJlptFilterChanged event,
    Emitter<LearnState> emit,
  ) {
    if (state.stateData.kanaType != KanaType.kanji) {
      emit(LearnLoaded(state.stateData.copyWith(jlptFilter: event.filter)));
      return null;
    }
    final updated = state.stateData.copyWith(jlptFilter: event.filter);
    emit(LearnLoaded(updated.copyWith(
      filteredKanjiEntries: _filterKanji(
        entries: updated.kanjiEntries,
        meanings: updated.kanjiMeanings,
        query: updated.query,
        jlptFilter: updated.jlptFilter,
      ),
    )));
  }

  List<KanjiEntry> _filterKanji({
    required List<KanjiEntry> entries,
    required Map<String, List<String>> meanings,
    required String query,
    required String jlptFilter,
  }) {
    final String trimmedQuery = query.trim().toLowerCase();
    final bool filterAll = jlptFilter == 'all';
    final List<KanjiEntry> filteredEntries = trimmedQuery.isEmpty
        ? entries
        : entries.where((entry) {
            final List<String> entryMeanings =
                meanings[entry.unicode] ?? const [];
            return entryMeanings.any(
              (meaning) => meaning.toLowerCase().contains(trimmedQuery),
            );
          }).toList();
    if (filterAll) {
      return filteredEntries;
    }
    return filteredEntries
        .where((entry) => entry.jlpt.toLowerCase() == jlptFilter)
        .toList();
  }
}
