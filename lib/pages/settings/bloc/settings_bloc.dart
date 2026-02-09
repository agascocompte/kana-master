import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/i18n/strings.g.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc({
    required this.settingsRepository,
  }) : super(SettingsInitial()) {
    on<SetKanaType>(_setKanaType);
    on<ChangeDifficultyLevel>(_changeDifficultyLevel);
    on<ChangeLanguage>(_changeLanguage);
    on<ChangeHapticsEnabled>(_changeHapticsEnabled);
    on<ChangeKanaScale>(_changeKanaScale);
    on<ChangeKanjiJlptFilter>(_changeKanjiJlptFilter);
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

    emit(SettingsUpdated(state.stateData.copyWith(
      kanaType: kanaType,
      difficultyLevel: difficultyLevel,
      languageCode: languageCode,
      hapticsEnabled: hapticsEnabled,
      kanaScale: kanaScale,
      kanjiJlptFilter: kanjiJlptFilter,
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

  AppLocale _parseLocale(String code) {
    for (final locale in AppLocale.values) {
      if (locale.languageCode == code) {
        return locale;
      }
    }
    return AppLocale.es;
  }
}
