import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<ToggleScriptType>(_toggleScriptType);
    on<ToggleDrawingTest>(_toggleDrawingTest);
  }

  FutureOr<void> _toggleScriptType(
      ToggleScriptType event, Emitter<SettingsState> emit) {
    ScriptType updatedSciptType =
        state.stateData.scriptType == ScriptType.hiragana
            ? ScriptType.katakana
            : ScriptType.hiragana;
    emit(ScriptTypeUpdated(
        state.stateData.copyWith(scriptType: updatedSciptType)));
  }

  FutureOr<void> _toggleDrawingTest(
      ToggleDrawingTest event, Emitter<SettingsState> emit) {
    emit(IsDrawingTestEnabledUpdated(state.stateData.copyWith(
        isDrawingTestEnabled: !state.stateData.isDrawingTestEnabled)));
  }
}
