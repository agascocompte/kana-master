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
