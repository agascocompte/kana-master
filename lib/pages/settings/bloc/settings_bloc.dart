import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;

  SettingsBloc({
    required this.settingsRepository,
  }) : super(SettingsInitial()) {
    on<ToggleKanaType>(_toggleScriptType);
    on<ChangeDifficultyLevel>(_changeDifficultyLevel);
    on<LoadSettings>(_loadSettings);
  }

  FutureOr<void> _toggleScriptType(
      ToggleKanaType event, Emitter<SettingsState> emit) async {
    KanaType updatedKanaType = state.stateData.kanaType == KanaType.hiragana
        ? KanaType.katakana
        : KanaType.hiragana;

    await settingsRepository.saveKanaType(updatedKanaType);

    emit(KanaTypeUpdated(state.stateData.copyWith(kanaType: updatedKanaType)));
  }

  FutureOr<void> _changeDifficultyLevel(
      ChangeDifficultyLevel event, Emitter<SettingsState> emit) async {
    await settingsRepository.saveDifficultyLevel(event.difficultyLevel);

    emit(IsDrawingTestEnabledUpdated(state.stateData.copyWith(
      difficultyLevel: event.difficultyLevel,
    )));
  }

  FutureOr<void> _loadSettings(
      LoadSettings event, Emitter<SettingsState> emit) async {
    KanaType kanaType = await settingsRepository.getKanaType();
    DifficultyLevel difficultyLevel =
        await settingsRepository.getDifficultyLevel();

    emit(SettingsUpdated(state.stateData.copyWith(
      kanaType: kanaType,
      difficultyLevel: difficultyLevel,
    )));
  }

  // TODO: Guardar en memoria los settings
}
