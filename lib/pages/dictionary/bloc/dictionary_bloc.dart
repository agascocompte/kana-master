import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/models/dictionary_entry.dart';
import 'package:kana_master/domain/repositories/dictionary_repository.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

@injectable
class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final DictionaryRepository dictionaryRepository;

  DictionaryBloc({
    required this.dictionaryRepository,
  }) : super(DictionaryInitial()) {
    on<SearchSubmitted>(_search);
    on<ClearSearch>(_clear);
  }

  FutureOr<void> _search(
      SearchSubmitted event, Emitter<DictionaryState> emit) async {
    emit(DictionaryLoading(state.stateData.copyWith(
      currentQuery: event.query,
      errorMessage: '',
    )));

    try {
      final results = await dictionaryRepository.search(event.query);
      emit(DictionaryResults(state.stateData.copyWith(
        entries: results,
      )));
    } catch (e) {
      emit(DictionaryError(state.stateData.copyWith(
        errorMessage: e.toString(),
        entries: [],
      )));
    }
  }

  FutureOr<void> _clear(ClearSearch event, Emitter<DictionaryState> emit) {
    emit(DictionaryInitial());
  }
}
