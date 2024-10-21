import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<ToggleKanaType>(_toggleScriptType);
    on<ChangeDifficultyLevel>(_changeDifficultyLevel);
  }

  FutureOr<void> _toggleScriptType(
      ToggleKanaType event, Emitter<SettingsState> emit) {
    KanaType updatedKanaType = state.stateData.kanaType == KanaType.hiragana
        ? KanaType.katakana
        : KanaType.hiragana;
    emit(KanaTypeUpdated(state.stateData.copyWith(kanaType: updatedKanaType)));
  }

  FutureOr<void> _changeDifficultyLevel(
      ChangeDifficultyLevel event, Emitter<SettingsState> emit) {
    emit(IsDrawingTestEnabledUpdated(state.stateData.copyWith(
      difficultyLevel: event.difficultyLevel,
    )));
  }

  // TODO: Guardar en memoria los settings
}
