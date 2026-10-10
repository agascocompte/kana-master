import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/models/material_entry.dart';
import 'package:kana_master/domain/models/material_import_result.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';
import 'package:kana_master/domain/usecases/check_material_answer.dart';
import 'package:kana_master/domain/usecases/import_material_csv.dart';
import 'package:kana_master/i18n/strings.g.dart';

part 'material_event.dart';
part 'material_state.dart';

@injectable
class MaterialBloc extends Bloc<MaterialEvent, MaterialState> {
  final ImportMaterialCsv importMaterialCsv;
  final CheckMaterialAnswer checkMaterialAnswer;
  final SettingsRepository settingsRepository;
  final Random _random = Random();

  MaterialBloc({
    required this.importMaterialCsv,
    required this.checkMaterialAnswer,
    required this.settingsRepository,
  }) : super(MaterialInitial()) {
    on<MaterialLoadSaved>(_loadSaved);
    on<MaterialClearRequested>(_clear);
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
        message: t.app.importedEntries(
            count: result.entries.length, file: result.fileName),
        messageType: MaterialMessageType.success,
        correctCount: 0,
        answeredCount: 0,
        currentScored: false,
      )));
      await _save();
    } catch (e) {
      emit(MaterialLoaded(state.stateData.copyWith(
        isLoading: false,
        message: t.app.errorImporting(error: e.toString()),
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
        message: t.app.materialsNeedImport,
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
      currentScored: false,
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
        message: t.app.materialsNeedStart,
        messageType: MaterialMessageType.warning,
      )));
      return null;
    }
    final String correct =
        state.stateData.currentEntry!.values[state.stateData.answerColumn!] ??
            '';
    final bool isCorrect =
        checkMaterialAnswer(state.stateData.userAnswer, correct);
    // Only the first attempt at each question counts towards the score.
    final bool scoreNow = !state.stateData.currentScored;
    final int answeredCount =
        state.stateData.answeredCount + (scoreNow ? 1 : 0);
    final int correctCount =
        state.stateData.correctCount + (scoreNow && isCorrect ? 1 : 0);
    if (isCorrect) {
      final MaterialEntry entry = state
          .stateData.entries[_random.nextInt(state.stateData.entries.length)];
      emit(MaterialLoaded(state.stateData.copyWith(
        currentEntry: entry,
        userAnswer: '',
        showExpectedAnswer: false,
        inputVersion: state.stateData.inputVersion + 1,
        message: t.app.correct,
        messageType: MaterialMessageType.success,
        correctCount: correctCount,
        answeredCount: answeredCount,
        currentScored: false,
      )));
      return null;
    }
    emit(MaterialLoaded(state.stateData.copyWith(
      message: t.app.incorrect,
      messageType: MaterialMessageType.warning,
      correctCount: correctCount,
      answeredCount: answeredCount,
      currentScored: true,
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
  ) async {
    emit(MaterialLoaded(state.stateData.copyWith(
      questionColumn: event.column,
      showExpectedAnswer: false,
      message: '',
      messageType: MaterialMessageType.none,
    )));
    await _save();
  }

  FutureOr<void> _updateAnswerColumn(
    MaterialAnswerColumnChanged event,
    Emitter<MaterialState> emit,
  ) async {
    emit(MaterialLoaded(state.stateData.copyWith(
      answerColumn: event.column,
      showExpectedAnswer: false,
      message: '',
      messageType: MaterialMessageType.none,
    )));
    await _save();
  }

  FutureOr<void> _toggleExpectedAnswer(
    MaterialToggleExpectedAnswer event,
    Emitter<MaterialState> emit,
  ) {
    final bool revealing = !state.stateData.showExpectedAnswer;
    // Looking at the answer before answering counts as a miss.
    final bool scoreNow = revealing &&
        !state.stateData.currentScored &&
        state.stateData.currentEntry != null;
    emit(MaterialLoaded(state.stateData.copyWith(
      showExpectedAnswer: revealing,
      message: '',
      messageType: MaterialMessageType.none,
      answeredCount: state.stateData.answeredCount + (scoreNow ? 1 : 0),
      currentScored: state.stateData.currentScored || scoreNow,
    )));
  }

  Future<void> _loadSaved(
    MaterialLoadSaved event,
    Emitter<MaterialState> emit,
  ) async {
    try {
      final raw = await settingsRepository.getMaterialsJson();
      if (raw == null || raw.isEmpty) return;
      final json = jsonDecode(raw) as Map<String, dynamic>;
      final headers = (json['headers'] as List<dynamic>).cast<String>();
      final entries = (json['rows'] as List<dynamic>)
          .map((row) => MaterialEntry(
              values: (row as Map<String, dynamic>).cast<String, String>()))
          .toList();
      if (headers.isEmpty || entries.isEmpty) return;
      String? column(String key) {
        final value = json[key] as String?;
        return value != null && headers.contains(value) ? value : null;
      }

      emit(MaterialLoaded(state.stateData.copyWith(
        headers: headers,
        entries: entries,
        importedFileName: json['fileName'] as String? ?? '',
        questionColumn: column('questionColumn') ?? headers.first,
        answerColumn: column('answerColumn') ??
            (headers.length > 1 ? headers[1] : headers.first),
      )));
    } catch (_) {
      // A corrupt saved list is simply ignored.
    }
  }

  Future<void> _clear(
    MaterialClearRequested event,
    Emitter<MaterialState> emit,
  ) async {
    emit(MaterialInitial());
    await settingsRepository.saveMaterialsJson('');
  }

  Future<void> _save() async {
    final data = state.stateData;
    if (data.entries.isEmpty) return;
    try {
      await settingsRepository.saveMaterialsJson(jsonEncode({
        'fileName': data.importedFileName,
        'headers': data.headers,
        'rows': [for (final entry in data.entries) entry.values],
        'questionColumn': data.questionColumn,
        'answerColumn': data.answerColumn,
      }));
    } catch (_) {}
  }
}
