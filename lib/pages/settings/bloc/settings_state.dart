part of 'settings_bloc.dart';

class SettingsStateData {
  final KanaType kanaType;
  final DifficultyLevel difficultyLevel;

  SettingsStateData({
    this.kanaType = KanaType.hiragana,
    this.difficultyLevel = DifficultyLevel.low,
  });

  SettingsStateData copyWith({
    KanaType? kanaType,
    DifficultyLevel? difficultyLevel,
  }) {
    return SettingsStateData(
      kanaType: kanaType ?? this.kanaType,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
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

class KanaTypeUpdated extends SettingsState {
  KanaTypeUpdated(SettingsStateData stateData) : super(stateData: stateData);
}

class IsDrawingTestEnabledUpdated extends SettingsState {
  IsDrawingTestEnabledUpdated(SettingsStateData stateData)
      : super(stateData: stateData);
}
