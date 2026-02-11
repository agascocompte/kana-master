import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/settings/widgets/settings_backup_card.dart';
import 'package:kana_master/pages/settings/widgets/dropdown_tile_setting.dart';
import 'package:kana_master/pages/settings/widgets/settings_slider_card.dart';
import 'package:kana_master/pages/settings/widgets/settings_switch_card.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/widgets/snackbars.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsBackupSuccess) {
          Snackbars.showSuccessScaffold(
            context,
            state.message,
            visibleDuration: const Duration(milliseconds: 5200),
          );
          context.read<StatsBloc>().add(LoadMemoryStats());
        } else if (state is SettingsBackupError) {
          Snackbars.showErrorScaffold(
            context,
            state.message,
            visibleDuration: const Duration(milliseconds: 3200),
          );
        }
      },
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
                      tr.app.settings,
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
                      tr.app.learningDefaults,
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
                          title: tr.app.language,
                          subtitle: tr.app.languageSubtitle,
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
                          title: tr.app.settingsHapticsTitle,
                          subtitle: tr.app.settingsHapticsSubtitle,
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
                          title: tr.app.settingsKanaSizeTitle,
                          subtitle: tr.app.settingsKanaSizeSubtitle,
                          icon: Icons.text_fields,
                          value: state.stateData.kanaScale,
                          min: 0.8,
                          max: 1.4,
                          divisions: 6,
                          label: tr.app.settingsKanaSizeValue(
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
                          title: tr.app.settingsKanjiJlptTitle,
                          subtitle: tr.app.settingsKanjiJlptSubtitle,
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
                        SettingsBackupCard(
                          title: tr.app.settingsBackupTitle,
                          subtitle: tr.app.settingsBackupSubtitle,
                          busy: state.stateData.backupBusy,
                          exportLabel: tr.app.settingsBackupExportButton,
                          importLabel: tr.app.settingsBackupImportButton,
                          onExport: () {
                            context
                                .read<SettingsBloc>()
                                .add(ExportStatsRequested());
                          },
                          onImport: () {
                            context
                                .read<SettingsBloc>()
                                .add(ImportStatsRequested());
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
  final tr = context.t;
  return [
    DropdownMenuItem(value: 'all', child: Text(tr.app.filterAll)),
    const DropdownMenuItem(value: 'n5', child: Text('N5')),
    const DropdownMenuItem(value: 'n4', child: Text('N4')),
    const DropdownMenuItem(value: 'n3', child: Text('N3')),
    const DropdownMenuItem(value: 'n2', child: Text('N2')),
    const DropdownMenuItem(value: 'n1', child: Text('N1')),
  ];
}
