import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          _SettingsSwitchCard(
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
                          _SettingsSliderCard(
                            title: t.app.settingsKanaSizeTitle,
                            subtitle: t.app.settingsKanaSizeSubtitle,
                            icon: Icons.text_fields,
                            value: state.stateData.kanaScale,
                            min: 0.8,
                            max: 1.4,
                            divisions: 6,
                            label: t.app.settingsKanaSizeValue(
                              value:
                                  state.stateData.kanaScale.toStringAsFixed(1),
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

class _SettingsSwitchCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsSwitchCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        secondary: Icon(icon, color: AppColors.ink),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.slate),
        ),
        activeThumbColor: AppColors.ink,
      ),
    );
  }
}

class _SettingsSliderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String label;
  final IconData icon;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  const _SettingsSliderCard({
    required this.title,
    required this.subtitle,
    required this.label,
    required this.icon,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, color: AppColors.ink),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: AppColors.slate),
            ),
            trailing: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
          ),
          Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
            activeColor: AppColors.ink,
            inactiveColor: AppColors.sand,
          ),
        ],
      ),
    );
  }
}
