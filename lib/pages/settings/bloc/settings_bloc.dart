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
    on<SetKanaType>(_setKanaType);
    on<ChangeDifficultyLevel>(_changeDifficultyLevel);
    on<LoadSettings>(_loadSettings);
  }

  FutureOr<void> _setKanaType(
      SetKanaType event, Emitter<SettingsState> emit) async {
    await settingsRepository.saveKanaType(event.kanaType);

    emit(KanaTypeUpdated(state.stateData.copyWith(kanaType: event.kanaType)));
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
}
