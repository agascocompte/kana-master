part of 'settings_bloc.dart';

class SettingsStateData {
  final KanaType kanaType;
  final bool isDrawingTestEnabled;

  SettingsStateData({
    this.kanaType = KanaType.hiragana,
    this.isDrawingTestEnabled = false,
  });

  SettingsStateData copyWith({
    KanaType? kanaType,
    bool? isDrawingTestEnabled,
  }) {
    return SettingsStateData(
      kanaType: kanaType ?? this.kanaType,
      isDrawingTestEnabled: isDrawingTestEnabled ?? this.isDrawingTestEnabled,
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
