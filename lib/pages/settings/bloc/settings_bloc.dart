import 'dart:async';

import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/data/datasources/stats_backup_file_data_source.dart';
import 'package:kana_master/data/datasources/stats_backup_local_data_source.dart';
import 'package:kana_master/data/repositories/stats_backup_repository_impl.dart';
import 'package:kana_master/domain/models/kana_groups.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/domain/providers/database_provider.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';
import 'package:kana_master/domain/usecases/export_stats_backup.dart';
import 'package:kana_master/domain/usecases/import_stats_backup.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/services/reminders/reminder_service.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;
  final ExportStatsBackup exportStatsBackup;
  final ImportStatsBackup importStatsBackup;

  SettingsBloc({
    required this.settingsRepository,
    ExportStatsBackup? exportStatsBackup,
    ImportStatsBackup? importStatsBackup,
  })  : exportStatsBackup = exportStatsBackup ?? _buildExportUseCase(),
        importStatsBackup = importStatsBackup ?? _buildImportUseCase(),
        super(SettingsInitial()) {
    on<SetKanaType>(_setKanaType);
    on<ChangeDifficultyLevel>(_changeDifficultyLevel);
    on<ChangeLanguage>(_changeLanguage);
    on<ChangeThemeMode>(_changeThemeMode);
    on<ChangeHapticsEnabled>(_changeHapticsEnabled);
    on<ChangeReminderEnabled>(_changeReminderEnabled);
    on<ChangeKanaScale>(_changeKanaScale);
    on<ChangeKanjiJlptFilter>(_changeKanjiJlptFilter);
    on<ChangeUseModelHiragana>(_changeUseModelHiragana);
    on<ChangeUseModelKatakana>(_changeUseModelKatakana);
    on<ChangeUseModelKanji>(_changeUseModelKanji);
    on<ChangeKanaGroups>(_changeKanaGroups);
    on<ChangeKanjiQuizMode>(_changeKanjiQuizMode);
    on<ChangeSessionLength>(_changeSessionLength);
    on<ExportStatsRequested>(_exportStats);
    on<ImportStatsRequested>(_importStats);
    on<LoadSettings>(_loadSettings);
  }

  FutureOr<void> _setKanaType(
      SetKanaType event, Emitter<SettingsState> emit) async {
    emit(KanaTypeUpdated(state.stateData.copyWith(kanaType: event.kanaType)));
    try {
      await settingsRepository.saveKanaType(event.kanaType);
    } catch (_) {}
  }

  FutureOr<void> _changeDifficultyLevel(
      ChangeDifficultyLevel event, Emitter<SettingsState> emit) async {
    emit(IsDrawingTestEnabledUpdated(state.stateData.copyWith(
      difficultyLevel: event.difficultyLevel,
    )));
    try {
      await settingsRepository.saveDifficultyLevel(event.difficultyLevel);
    } catch (_) {}
  }

  FutureOr<void> _loadSettings(
      LoadSettings event, Emitter<SettingsState> emit) async {
    KanaType kanaType = await settingsRepository.getKanaType();
    DifficultyLevel difficultyLevel =
        await settingsRepository.getDifficultyLevel();
    String languageCode = await settingsRepository.getLanguageCode();
    bool hapticsEnabled = await settingsRepository.getHapticsEnabled();
    double kanaScale = await settingsRepository.getKanaScale();
    final ThemeMode themeMode = await settingsRepository.getThemeMode();
    String kanjiJlptFilter = await settingsRepository.getKanjiJlptFilter();
    bool useModelHiragana = await settingsRepository.getUseModelHiragana();
    bool useModelKatakana = await settingsRepository.getUseModelKatakana();
    bool useModelKanji = await settingsRepository.getUseModelKanji();
    final Set<String>? kanaGroupsHiragana =
        await settingsRepository.getKanaGroups(KanaType.hiragana);
    final Set<String>? kanaGroupsKatakana =
        await settingsRepository.getKanaGroups(KanaType.katakana);
    final KanjiQuizMode kanjiQuizMode =
        await settingsRepository.getKanjiQuizMode();
    final int sessionLength = await settingsRepository.getSessionLength();
    final bool reminderEnabled = await ReminderService.instance.isEnabled();

    emit(SettingsUpdated(state.stateData.copyWith(
      kanaType: kanaType,
      difficultyLevel: difficultyLevel,
      languageCode: languageCode,
      hapticsEnabled: hapticsEnabled,
      kanaScale: kanaScale,
      themeMode: themeMode,
      kanjiJlptFilter: kanjiJlptFilter,
      useModelHiragana: useModelHiragana,
      useModelKatakana: useModelKatakana,
      useModelKanji: useModelKanji,
      kanaGroupsHiragana: _validGroups(KanaType.hiragana, kanaGroupsHiragana),
      kanaGroupsKatakana: _validGroups(KanaType.katakana, kanaGroupsKatakana),
      kanjiQuizMode: kanjiQuizMode,
      sessionLength: sessionLength,
      reminderEnabled: reminderEnabled,
    )));
    LocaleSettings.setLocale(_parseLocale(languageCode));
    // Scheduled here so the reminder text uses the saved language.
    await ReminderService.instance.reschedule(force: true);
  }

  FutureOr<void> _changeThemeMode(
      ChangeThemeMode event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(state.stateData.copyWith(themeMode: event.mode)));
    try {
      await settingsRepository.saveThemeMode(event.mode);
    } catch (_) {}
  }

  FutureOr<void> _changeLanguage(
      ChangeLanguage event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(
        state.stateData.copyWith(languageCode: event.languageCode)));
    LocaleSettings.setLocale(_parseLocale(event.languageCode));
    try {
      await settingsRepository.saveLanguageCode(event.languageCode);
    } catch (_) {}
    // Pending reminders keep the text of the language they were made in.
    await ReminderService.instance.reschedule(force: true);
  }

  FutureOr<void> _changeHapticsEnabled(
      ChangeHapticsEnabled event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(
        state.stateData.copyWith(hapticsEnabled: event.enabled)));
    try {
      await settingsRepository.saveHapticsEnabled(event.enabled);
    } catch (_) {}
  }

  FutureOr<void> _changeReminderEnabled(
      ChangeReminderEnabled event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(
        state.stateData.copyWith(reminderEnabled: event.enabled)));
    final bool applied =
        await ReminderService.instance.setEnabled(event.enabled);
    if (!applied) {
      emit(SettingsReminderBlocked(
          state.stateData.copyWith(reminderEnabled: false)));
    }
  }

  FutureOr<void> _changeKanaScale(
      ChangeKanaScale event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(state.stateData.copyWith(kanaScale: event.scale)));
    try {
      await settingsRepository.saveKanaScale(event.scale);
    } catch (_) {}
  }

  FutureOr<void> _changeKanjiJlptFilter(
      ChangeKanjiJlptFilter event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(
        state.stateData.copyWith(kanjiJlptFilter: event.filter)));
    try {
      await settingsRepository.saveKanjiJlptFilter(event.filter);
    } catch (_) {}
  }

  FutureOr<void> _changeUseModelHiragana(
      ChangeUseModelHiragana event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(
        state.stateData.copyWith(useModelHiragana: event.enabled)));
    try {
      await settingsRepository.saveUseModelHiragana(event.enabled);
    } catch (_) {}
  }

  FutureOr<void> _changeUseModelKatakana(
      ChangeUseModelKatakana event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(
        state.stateData.copyWith(useModelKatakana: event.enabled)));
    try {
      await settingsRepository.saveUseModelKatakana(event.enabled);
    } catch (_) {}
  }

  FutureOr<void> _changeUseModelKanji(
      ChangeUseModelKanji event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(state.stateData.copyWith(useModelKanji: event.enabled)));
    try {
      await settingsRepository.saveUseModelKanji(event.enabled);
    } catch (_) {}
  }

  /// Saved groups that still exist, or the defaults if none remain.
  Set<String> _validGroups(KanaType type, Set<String>? saved) {
    final known = kanaGroupsFor(type).map((g) => g.id).toSet();
    final valid = saved?.where(known.contains).toSet() ?? const <String>{};
    return valid.isEmpty ? defaultKanaGroupIds(type) : valid;
  }

  FutureOr<void> _changeKanaGroups(
      ChangeKanaGroups event, Emitter<SettingsState> emit) async {
    if (event.groupIds.isEmpty) return;
    emit(SettingsUpdated(event.kanaType == KanaType.katakana
        ? state.stateData.copyWith(kanaGroupsKatakana: event.groupIds)
        : state.stateData.copyWith(kanaGroupsHiragana: event.groupIds)));
    try {
      await settingsRepository.saveKanaGroups(event.kanaType, event.groupIds);
    } catch (_) {}
  }

  FutureOr<void> _changeKanjiQuizMode(
      ChangeKanjiQuizMode event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(state.stateData.copyWith(kanjiQuizMode: event.mode)));
    try {
      await settingsRepository.saveKanjiQuizMode(event.mode);
    } catch (_) {}
  }

  FutureOr<void> _changeSessionLength(
      ChangeSessionLength event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(
        state.stateData.copyWith(sessionLength: event.length)));
    try {
      await settingsRepository.saveSessionLength(event.length);
    } catch (_) {}
  }

  FutureOr<void> _exportStats(
    ExportStatsRequested event,
    Emitter<SettingsState> emit,
  ) async {
    emit(SettingsUpdated(state.stateData.copyWith(backupBusy: true)));
    try {
      final path = await exportStatsBackup();
      emit(SettingsBackupSuccess(
        state.stateData.copyWith(backupBusy: false),
        message: t.app.settingsBackupExported(path: path),
      ));
    } catch (e) {
      final text = e.toString();
      if (text.contains('Export cancelled')) {
        emit(SettingsUpdated(state.stateData.copyWith(backupBusy: false)));
        return;
      }
      emit(SettingsBackupError(
        state.stateData.copyWith(backupBusy: false),
        message: t.app.settingsBackupError(error: text),
      ));
    }
  }

  FutureOr<void> _importStats(
    ImportStatsRequested event,
    Emitter<SettingsState> emit,
  ) async {
    emit(SettingsUpdated(state.stateData.copyWith(backupBusy: true)));
    try {
      final imported = await importStatsBackup();
      await ReminderService.instance.reschedule(force: true);
      emit(SettingsBackupSuccess(
        state.stateData.copyWith(backupBusy: false),
        message: t.app.settingsBackupImported(count: imported),
      ));
    } catch (e) {
      final text = e.toString();
      if (text.contains('No backup file selected')) {
        emit(SettingsUpdated(state.stateData.copyWith(backupBusy: false)));
        return;
      }
      emit(SettingsBackupError(
        state.stateData.copyWith(backupBusy: false),
        message: t.app.settingsBackupError(error: text),
      ));
    }
  }

  AppLocale _parseLocale(String code) {
    for (final locale in AppLocale.values) {
      if (locale.languageCode == code) {
        return locale;
      }
    }
    return AppLocale.es;
  }

  static ExportStatsBackup _buildExportUseCase() {
    final repository = StatsBackupRepositoryImpl(
      StatsBackupLocalDataSource(DatabaseProvider.dbProvider),
      StatsBackupFileDataSource(),
    );
    return ExportStatsBackup(repository);
  }

  static ImportStatsBackup _buildImportUseCase() {
    final repository = StatsBackupRepositoryImpl(
      StatsBackupLocalDataSource(DatabaseProvider.dbProvider),
      StatsBackupFileDataSource(),
    );
    return ImportStatsBackup(repository);
  }
}
