part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class LoadSettings extends SettingsEvent {}

class ToggleKanaType extends SettingsEvent {}

class ChangeDifficultyLevel extends SettingsEvent {
  final DifficultyLevel difficultyLevel;

  ChangeDifficultyLevel({required this.difficultyLevel});
}
