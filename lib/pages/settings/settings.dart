import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/settings/widgets/dropdown_tile_setting.dart';
import 'package:kana_master/pages/settings/widgets/settings_slider_card.dart';
import 'package:kana_master/pages/settings/widgets/settings_switch_card.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.mist, AppColors.sand],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 18, 16, 6),
                    child: Text(
                      t.app.settings,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Text(
                      t.app.learningDefaults,
                      style: const TextStyle(
                        color: AppColors.slate,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        DropdownTileSetting(
                          title: t.app.language,
                          subtitle: t.app.languageSubtitle,
                          currentValue: state.stateData.languageCode,
                          icon: Icons.translate,
                          items: _languageItems(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              context.read<SettingsBloc>().add(
                                    ChangeLanguage(languageCode: newValue),
                                  );
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        SettingsSwitchCard(
                          title: t.app.settingsHapticsTitle,
                          subtitle: t.app.settingsHapticsSubtitle,
                          icon: Icons.vibration,
                          value: state.stateData.hapticsEnabled,
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(
                                  ChangeHapticsEnabled(enabled: value),
                                );
                          },
                        ),
                        const SizedBox(height: 12),
                        SettingsSliderCard(
                          title: t.app.settingsKanaSizeTitle,
                          subtitle: t.app.settingsKanaSizeSubtitle,
                          icon: Icons.text_fields,
                          value: state.stateData.kanaScale,
                          min: 0.8,
                          max: 1.4,
                          divisions: 6,
                          label: t.app.settingsKanaSizeValue(
                            value: state.stateData.kanaScale.toStringAsFixed(1),
                          ),
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(
                                  ChangeKanaScale(scale: value),
                                );
                          },
                        ),
                        const SizedBox(height: 12),
                        DropdownTileSetting(
                          title: t.app.settingsKanjiJlptTitle,
                          subtitle: t.app.settingsKanjiJlptSubtitle,
                          currentValue: state.stateData.kanjiJlptFilter,
                          icon: Icons.filter_alt_outlined,
                          items: _jlptItems(context),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              context.read<SettingsBloc>().add(
                                    ChangeKanjiJlptFilter(filter: newValue),
                                  );
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
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
    'ca': 'Català',
    'fr': 'Français',
    'de': 'Deutsch',
    'it': 'Italiano',
    'pt': 'Português',
    'ru': 'Русский',
    'ja': '日本語',
    'zh': '中文',
    'ko': '한국어',
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

List<DropdownMenuItem<String>> _jlptItems(BuildContext context) {
  return [
    DropdownMenuItem(value: 'all', child: Text(t.app.filterAll)),
    const DropdownMenuItem(value: 'n5', child: Text('N5')),
    const DropdownMenuItem(value: 'n4', child: Text('N4')),
    const DropdownMenuItem(value: 'n3', child: Text('N3')),
    const DropdownMenuItem(value: 'n2', child: Text('N2')),
    const DropdownMenuItem(value: 'n1', child: Text('N1')),
  ];
}
