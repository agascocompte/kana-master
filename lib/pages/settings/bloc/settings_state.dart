part of 'settings_bloc.dart';

class SettingsStateData {
  final KanaType kanaType;
  final DifficultyLevel difficultyLevel;
  final String languageCode;
  final bool hapticsEnabled;
  final double kanaScale;
  final String kanjiJlptFilter;
  final bool backupBusy;
  final bool useModelHiragana;
  final bool useModelKatakana;
  final bool useModelKanji;
  final Set<String> kanaGroupsHiragana;
  final Set<String> kanaGroupsKatakana;
  final KanjiQuizMode kanjiQuizMode;
  final int sessionLength;
  final ThemeMode themeMode;

  SettingsStateData({
    this.kanaType = KanaType.hiragana,
    this.difficultyLevel = DifficultyLevel.low,
    this.languageCode = 'es',
    this.hapticsEnabled = true,
    this.kanaScale = 1.0,
    this.kanjiJlptFilter = 'n5',
    this.backupBusy = false,
    this.useModelHiragana = true,
    this.useModelKatakana = true,
    this.useModelKanji = false,
    Set<String>? kanaGroupsHiragana,
    Set<String>? kanaGroupsKatakana,
    this.kanjiQuizMode = KanjiQuizMode.meaning,
    this.sessionLength = defaultSessionLength,
    this.themeMode = ThemeMode.system,
  })  : kanaGroupsHiragana =
            kanaGroupsHiragana ?? defaultKanaGroupIds(KanaType.hiragana),
        kanaGroupsKatakana =
            kanaGroupsKatakana ?? defaultKanaGroupIds(KanaType.katakana);

  Set<String> kanaGroupsFor(KanaType type) =>
      type == KanaType.katakana ? kanaGroupsKatakana : kanaGroupsHiragana;

  SettingsStateData copyWith({
    KanaType? kanaType,
    DifficultyLevel? difficultyLevel,
    String? languageCode,
    bool? hapticsEnabled,
    double? kanaScale,
    String? kanjiJlptFilter,
    bool? backupBusy,
    bool? useModelHiragana,
    bool? useModelKatakana,
    bool? useModelKanji,
    Set<String>? kanaGroupsHiragana,
    Set<String>? kanaGroupsKatakana,
    KanjiQuizMode? kanjiQuizMode,
    int? sessionLength,
    ThemeMode? themeMode,
  }) {
    return SettingsStateData(
      kanaType: kanaType ?? this.kanaType,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      languageCode: languageCode ?? this.languageCode,
      hapticsEnabled: hapticsEnabled ?? this.hapticsEnabled,
      kanaScale: kanaScale ?? this.kanaScale,
      kanjiJlptFilter: kanjiJlptFilter ?? this.kanjiJlptFilter,
      backupBusy: backupBusy ?? this.backupBusy,
      useModelHiragana: useModelHiragana ?? this.useModelHiragana,
      useModelKatakana: useModelKatakana ?? this.useModelKatakana,
      useModelKanji: useModelKanji ?? this.useModelKanji,
      kanaGroupsHiragana: kanaGroupsHiragana ?? this.kanaGroupsHiragana,
      kanaGroupsKatakana: kanaGroupsKatakana ?? this.kanaGroupsKatakana,
      kanjiQuizMode: kanjiQuizMode ?? this.kanjiQuizMode,
      sessionLength: sessionLength ?? this.sessionLength,
      themeMode: themeMode ?? this.themeMode,
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
