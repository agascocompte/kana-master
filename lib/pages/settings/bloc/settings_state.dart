part of 'settings_bloc.dart';

class SettingsStateData {
  final KanaType kanaType;
  final DifficultyLevel difficultyLevel;
  final String languageCode;

  SettingsStateData({
    this.kanaType = KanaType.hiragana,
    this.difficultyLevel = DifficultyLevel.low,
    this.languageCode = 'es',
  });

  SettingsStateData copyWith({
    KanaType? kanaType,
    DifficultyLevel? difficultyLevel,
    String? languageCode,
  }) {
    return SettingsStateData(
      kanaType: kanaType ?? this.kanaType,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      languageCode: languageCode ?? this.languageCode,
    );
  }
}

abstract class SettingsState {
  final SettingsStateData stateData;

  SettingsState({required this.stateData});
}

class SettingsInitial extends SettingsState {
  SettingsInitial() : super(stateData: SettingsStateData());
}

class SettingsUpdated extends SettingsState {
  SettingsUpdated(SettingsStateData stateData) : super(stateData: stateData);
}

class KanaTypeUpdated extends SettingsState {
  KanaTypeUpdated(SettingsStateData stateData) : super(stateData: stateData);
}

class IsDrawingTestEnabledUpdated extends SettingsState {
  IsDrawingTestEnabledUpdated(SettingsStateData stateData)
      : super(stateData: stateData);
}
