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
    await settingsRepository.saveKanaType(event.kanaType);

    emit(KanaTypeUpdated(state.stateData.copyWith(kanaType: event.kanaType)));
  }

  FutureOr<void> _changeDifficultyLevel(
      ChangeDifficultyLevel event, Emitter<SettingsState> emit) async {
    await settingsRepository.saveDifficultyLevel(event.difficultyLevel);

    emit(IsDrawingTestEnabledUpdated(state.stateData.copyWith(
      difficultyLevel: event.difficultyLevel,
    )));
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
    await settingsRepository.saveLanguageCode(event.languageCode);
    emit(SettingsUpdated(
        state.stateData.copyWith(languageCode: event.languageCode)));
    LocaleSettings.setLocale(_parseLocale(event.languageCode));
  }

  FutureOr<void> _changeHapticsEnabled(
      ChangeHapticsEnabled event, Emitter<SettingsState> emit) async {
    await settingsRepository.saveHapticsEnabled(event.enabled);
    emit(SettingsUpdated(
        state.stateData.copyWith(hapticsEnabled: event.enabled)));
  }

  FutureOr<void> _changeKanaScale(
      ChangeKanaScale event, Emitter<SettingsState> emit) async {
    await settingsRepository.saveKanaScale(event.scale);
    emit(SettingsUpdated(state.stateData.copyWith(kanaScale: event.scale)));
  }

  FutureOr<void> _changeKanjiJlptFilter(
      ChangeKanjiJlptFilter event, Emitter<SettingsState> emit) async {
    await settingsRepository.saveKanjiJlptFilter(event.filter);
    emit(SettingsUpdated(
        state.stateData.copyWith(kanjiJlptFilter: event.filter)));
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
