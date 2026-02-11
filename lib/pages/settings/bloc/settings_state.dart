part of 'settings_bloc.dart';

class SettingsStateData {
  final KanaType kanaType;
  final DifficultyLevel difficultyLevel;
  final String languageCode;
  final bool hapticsEnabled;
  final double kanaScale;
  final String kanjiJlptFilter;
  final bool backupBusy;

  SettingsStateData({
    this.kanaType = KanaType.hiragana,
    this.difficultyLevel = DifficultyLevel.low,
    this.languageCode = 'es',
    this.hapticsEnabled = true,
    this.kanaScale = 1.0,
    this.kanjiJlptFilter = 'all',
    this.backupBusy = false,
  });

  SettingsStateData copyWith({
    KanaType? kanaType,
    DifficultyLevel? difficultyLevel,
    String? languageCode,
    bool? hapticsEnabled,
    double? kanaScale,
    String? kanjiJlptFilter,
    bool? backupBusy,
  }) {
    return SettingsStateData(
      kanaType: kanaType ?? this.kanaType,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      languageCode: languageCode ?? this.languageCode,
      hapticsEnabled: hapticsEnabled ?? this.hapticsEnabled,
      kanaScale: kanaScale ?? this.kanaScale,
      kanjiJlptFilter: kanjiJlptFilter ?? this.kanjiJlptFilter,
      backupBusy: backupBusy ?? this.backupBusy,
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

class SettingsBackupSuccess extends SettingsState {
  final String message;

  SettingsBackupSuccess(
    SettingsStateData stateData, {
    required this.message,
  }) : super(stateData: stateData);
}

class SettingsBackupError extends SettingsState {
  final String message;

  SettingsBackupError(
    SettingsStateData stateData, {
    required this.message,
  }) : super(stateData: stateData);
}
