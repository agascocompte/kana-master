part of 'settings_bloc.dart';

enum ScriptType { hiragana, katakana }

class SettingsStateData {
  final ScriptType scriptType;
  final bool isDrawingTestEnabled;

  SettingsStateData({
    this.scriptType = ScriptType.hiragana,
    this.isDrawingTestEnabled = false,
  });

  SettingsStateData copyWith({
    ScriptType? scriptType,
    bool? isDrawingTestEnabled,
  }) {
    return SettingsStateData(
      scriptType: scriptType ?? this.scriptType,
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

class ScriptTypeUpdated extends SettingsState {
  ScriptTypeUpdated(SettingsStateData stateData) : super(stateData: stateData);
}

class IsDrawingTestEnabledUpdated extends SettingsState {
  IsDrawingTestEnabledUpdated(SettingsStateData stateData)
      : super(stateData: stateData);
}
