import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/settings/widgets/dropdown_tile_setting.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(t.app.settings),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.mist, AppColors.sand],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.app.learningDefaults,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownTileSetting(
                    title: t.app.language,
                    subtitle: t.app.languageSubtitle,
                    currentValue: state.stateData.languageCode,
                    icon: Icons.translate,
                    items: _languageItems(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        context
                            .read<SettingsBloc>()
                            .add(ChangeLanguage(languageCode: newValue));
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  DropdownTileSetting(
                    title: t.app.testDifficulty,
                    subtitle: t.app.testDifficultySubtitle,
                    currentValue: state.stateData.difficultyLevel,
                    icon: Icons.speed_outlined,
                    items: DifficultyLevel.values.map((DifficultyLevel level) {
                      String description;
                      switch (level) {
                        case DifficultyLevel.low:
                          description = t.app.difficultyEasyDesc;
                          break;
                        case DifficultyLevel.medium:
                          description = t.app.difficultyMediumDesc;
                          break;
                        case DifficultyLevel.high:
                          description = t.app.difficultyHardDesc;
                          break;
                      }

                      return DropdownMenuItem<DifficultyLevel>(
                        value: level,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_difficultyLabel(level)),
                            Text(
                              description,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (DifficultyLevel? newValue) {
                      if (newValue != null) {
                        context.read<SettingsBloc>().add(
                            ChangeDifficultyLevel(difficultyLevel: newValue));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

List<DropdownMenuItem<String>> _languageItems() {
  const languages = {
    'es': 'Español',
    'en': 'English',
    'fr': 'Français',
    'de': 'Deutsch',
    'it': 'Italiano',
    'pt': 'Português',
    'ru': 'Русский',
    'ja': '日本語',
    'zh': '中文',
    'ko': '한국어',
    'ca': 'Català',
  };
  return languages.entries
      .map(
        (entry) => DropdownMenuItem<String>(
          value: entry.key,
          child: Text(entry.value),
        ),
      )
      .toList();
}

String _difficultyLabel(DifficultyLevel level) {
  switch (level) {
    case DifficultyLevel.low:
      return t.app.difficultyEasy;
    case DifficultyLevel.medium:
      return t.app.difficultyMedium;
    case DifficultyLevel.high:
      return t.app.difficultyHard;
  }
}
