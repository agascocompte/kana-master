part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class LoadSettings extends SettingsEvent {}

class SetKanaType extends SettingsEvent {
  final KanaType kanaType;

  SetKanaType({required this.kanaType});
}

class ChangeDifficultyLevel extends SettingsEvent {
  final DifficultyLevel difficultyLevel;

  ChangeDifficultyLevel({required this.difficultyLevel});
}

class ChangeLanguage extends SettingsEvent {
  final String languageCode;

  ChangeLanguage({required this.languageCode});
}

class ChangeHapticsEnabled extends SettingsEvent {
  final bool enabled;

  ChangeHapticsEnabled({required this.enabled});
}

class ChangeKanaScale extends SettingsEvent {
  final double scale;

  ChangeKanaScale({required this.scale});
}

class ChangeKanjiJlptFilter extends SettingsEvent {
  final String filter;

  ChangeKanjiJlptFilter({required this.filter});
}

class ChangeUseModelHiragana extends SettingsEvent {
  final bool enabled;

  ChangeUseModelHiragana({required this.enabled});
}

class ChangeUseModelKatakana extends SettingsEvent {
  final bool enabled;

  ChangeUseModelKatakana({required this.enabled});
}

class ChangeUseModelKanji extends SettingsEvent {
  final bool enabled;

  ChangeUseModelKanji({required this.enabled});
}

class ExportStatsRequested extends SettingsEvent {}

class ImportStatsRequested extends SettingsEvent {}
