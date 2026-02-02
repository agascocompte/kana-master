import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/models/material_entry.dart';
import 'package:kana_master/domain/models/material_import_result.dart';
import 'package:kana_master/domain/usecases/check_material_answer.dart';
import 'package:kana_master/domain/usecases/import_material_csv.dart';

part 'material_event.dart';
part 'material_state.dart';

@injectable
class MaterialBloc extends Bloc<MaterialEvent, MaterialState> {
  final ImportMaterialCsv importMaterialCsv;
  final CheckMaterialAnswer checkMaterialAnswer;
  final Random _random = Random();

  MaterialBloc({
    required this.importMaterialCsv,
    required this.checkMaterialAnswer,
  }) : super(MaterialInitial()) {
    on<MaterialImportRequested>(_importCsv);
    on<MaterialQuestionRequested>(_nextQuestion);
    on<MaterialAnswerSubmitted>(_checkAnswer);
    on<MaterialAnswerUpdated>(_updateAnswer);
    on<MaterialQuestionColumnChanged>(_updateQuestionColumn);
    on<MaterialAnswerColumnChanged>(_updateAnswerColumn);
    on<MaterialToggleExpectedAnswer>(_toggleExpectedAnswer);
  }

  Future<void> _importCsv(
    MaterialImportRequested event,
    Emitter<MaterialState> emit,
  ) async {
    emit(MaterialLoading(state.stateData.copyWith(
      isLoading: true,
      message: '',
      messageType: MaterialMessageType.none,
    )));
    try {
      final MaterialImportResult? result = await importMaterialCsv();
      if (result == null) {
        emit(MaterialLoaded(state.stateData.copyWith(
          isLoading: false,
          message: '',
          messageType: MaterialMessageType.none,
        )));
        return;
      }
      emit(MaterialLoaded(state.stateData.copyWith(
        isLoading: false,
        headers: result.headers,
        entries: result.entries,
        questionColumn: result.headers.isNotEmpty ? result.headers.first : null,
        answerColumn: result.headers.length > 1
            ? result.headers[1]
            : result.headers.first,
        importedFileName: result.fileName,
        currentEntry: null,
        userAnswer: '',
        showExpectedAnswer: false,
        inputVersion: state.stateData.inputVersion + 1,
        message:
            'Imported ${result.entries.length} entries from ${result.fileName}',
        messageType: MaterialMessageType.success,
      )));
    } catch (e) {
      emit(MaterialLoaded(state.stateData.copyWith(
        isLoading: false,
        message: 'Error importing: $e',
        messageType: MaterialMessageType.error,
      )));
    }
  }

  FutureOr<void> _nextQuestion(
    MaterialQuestionRequested event,
    Emitter<MaterialState> emit,
  ) {
    if (state.stateData.entries.isEmpty ||
        state.stateData.questionColumn == null ||
        state.stateData.answerColumn == null) {
      emit(MaterialLoaded(state.stateData.copyWith(
        message: 'Import a CSV and choose columns before practicing.',
        messageType: MaterialMessageType.warning,
      )));
      return null;
    }
    final MaterialEntry entry = state
        .stateData.entries[_random.nextInt(state.stateData.entries.length)];
    emit(MaterialLoaded(state.stateData.copyWith(
      currentEntry: entry,
      userAnswer: '',
      showExpectedAnswer: false,
      inputVersion: state.stateData.inputVersion + 1,
      message: '',
      messageType: MaterialMessageType.none,
    )));
  }

  FutureOr<void> _checkAnswer(
    MaterialAnswerSubmitted event,
    Emitter<MaterialState> emit,
  ) {
    if (state.stateData.currentEntry == null ||
        state.stateData.questionColumn == null ||
        state.stateData.answerColumn == null) {
      emit(MaterialLoaded(state.stateData.copyWith(
        message: 'First start a question from your material.',
        messageType: MaterialMessageType.warning,
      )));
      return null;
    }
    final String correct =
        state.stateData.currentEntry!.values[state.stateData.answerColumn!] ??
            '';
    final bool isCorrect =
        checkMaterialAnswer(state.stateData.userAnswer, correct);
    if (isCorrect) {
      final MaterialEntry entry = state
          .stateData.entries[_random.nextInt(state.stateData.entries.length)];
      emit(MaterialLoaded(state.stateData.copyWith(
        currentEntry: entry,
        userAnswer: '',
        showExpectedAnswer: false,
        inputVersion: state.stateData.inputVersion + 1,
        message: 'Correct!',
        messageType: MaterialMessageType.success,
      )));
      return null;
    }
    emit(MaterialLoaded(state.stateData.copyWith(
      message: 'Incorrect answer',
      messageType: MaterialMessageType.warning,
    )));
  }

  FutureOr<void> _updateAnswer(
    MaterialAnswerUpdated event,
    Emitter<MaterialState> emit,
  ) {
    emit(MaterialLoaded(state.stateData.copyWith(
      userAnswer: event.answer,
      message: '',
      messageType: MaterialMessageType.none,
    )));
  }

  FutureOr<void> _updateQuestionColumn(
    MaterialQuestionColumnChanged event,
    Emitter<MaterialState> emit,
  ) {
    emit(MaterialLoaded(state.stateData.copyWith(
      questionColumn: event.column,
      showExpectedAnswer: false,
      message: '',
      messageType: MaterialMessageType.none,
    )));
  }

  FutureOr<void> _updateAnswerColumn(
    MaterialAnswerColumnChanged event,
    Emitter<MaterialState> emit,
  ) {
    emit(MaterialLoaded(state.stateData.copyWith(
      answerColumn: event.column,
      showExpectedAnswer: false,
      message: '',
      messageType: MaterialMessageType.none,
    )));
  }

  FutureOr<void> _toggleExpectedAnswer(
    MaterialToggleExpectedAnswer event,
    Emitter<MaterialState> emit,
  ) {
    emit(MaterialLoaded(state.stateData.copyWith(
      showExpectedAnswer: !state.stateData.showExpectedAnswer,
      message: '',
      messageType: MaterialMessageType.none,
    )));
  }
}
