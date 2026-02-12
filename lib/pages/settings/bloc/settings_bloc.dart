import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/data/datasources/stats_backup_file_data_source.dart';
import 'package:kana_master/data/datasources/stats_backup_local_data_source.dart';
import 'package:kana_master/data/repositories/stats_backup_repository_impl.dart';
import 'package:kana_master/domain/providers/database_provider.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';
import 'package:kana_master/domain/usecases/export_stats_backup.dart';
import 'package:kana_master/domain/usecases/import_stats_backup.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/i18n/strings.g.dart';

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
    on<ChangeHapticsEnabled>(_changeHapticsEnabled);
    on<ChangeKanaScale>(_changeKanaScale);
    on<ChangeKanjiJlptFilter>(_changeKanjiJlptFilter);
    on<ChangeUseModelHiragana>(_changeUseModelHiragana);
    on<ChangeUseModelKatakana>(_changeUseModelKatakana);
    on<ChangeUseModelKanji>(_changeUseModelKanji);
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
    String kanjiJlptFilter = await settingsRepository.getKanjiJlptFilter();
    bool useModelHiragana = await settingsRepository.getUseModelHiragana();
    bool useModelKatakana = await settingsRepository.getUseModelKatakana();
    bool useModelKanji = await settingsRepository.getUseModelKanji();

    emit(SettingsUpdated(state.stateData.copyWith(
      kanaType: kanaType,
      difficultyLevel: difficultyLevel,
      languageCode: languageCode,
      hapticsEnabled: hapticsEnabled,
      kanaScale: kanaScale,
      kanjiJlptFilter: kanjiJlptFilter,
      useModelHiragana: useModelHiragana,
      useModelKatakana: useModelKatakana,
      useModelKanji: useModelKanji,
    )));
    LocaleSettings.setLocale(_parseLocale(languageCode));
  }

  FutureOr<void> _changeLanguage(
      ChangeLanguage event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(
        state.stateData.copyWith(languageCode: event.languageCode)));
    LocaleSettings.setLocale(_parseLocale(event.languageCode));
    try {
      await settingsRepository.saveLanguageCode(event.languageCode);
    } catch (_) {}
  }

  FutureOr<void> _changeHapticsEnabled(
      ChangeHapticsEnabled event, Emitter<SettingsState> emit) async {
    emit(SettingsUpdated(
        state.stateData.copyWith(hapticsEnabled: event.enabled)));
    try {
      await settingsRepository.saveHapticsEnabled(event.enabled);
    } catch (_) {}
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
