import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/premium/bloc/premium_bloc.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/settings/widgets/premium_locked_wrapper.dart';
import 'package:kana_master/pages/settings/widgets/settings_backup_card.dart';
import 'package:kana_master/pages/settings/widgets/dropdown_tile_setting.dart';
import 'package:kana_master/pages/settings/widgets/settings_section_header.dart';
import 'package:kana_master/pages/settings/widgets/settings_slider_card.dart';
import 'package:kana_master/pages/settings/widgets/settings_switch_card.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/router/router.dart';
import 'package:kana_master/services/reminders/reminder_service.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/widgets/dialogs.dart';
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
        } else if (state is SettingsReminderBlocked) {
          Snackbars.showWarningScaffold(
            context,
            tr.app.settingsReminderBlocked,
            visibleDuration: const Duration(milliseconds: 4200),
          );
          ReminderService.instance.openSystemSettings();
        } else if (state is SettingsBackupError) {
          Snackbars.showErrorScaffold(
            context,
            state.message,
            visibleDuration: const Duration(milliseconds: 3200),
          );
        }
      },
      builder: (context, state) {
        final bool isPremium = context.watch<PremiumBloc>().state.isPremium;
        void openPremium() => context.push(AppRouter.premiumRoute);
        void onLockedTap() {
          Snackbars.showWarningScaffold(context, tr.app.premiumLockedMessage);
          openPremium();
        }

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
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
                      style: TextStyle(
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
                      style: TextStyle(
                        color: AppColors.slate,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        SettingsSectionHeader(
                          title: tr.app.premiumSectionTitle,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.sand),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    isPremium
                                        ? Icons.verified_outlined
                                        : Icons.workspace_premium_outlined,
                                    color: AppColors.ink,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      isPremium
                                          ? tr.app.premiumOwnedBadge
                                          : tr.app.premiumSectionSubtitle,
                                      style: TextStyle(
                                        color: AppColors.graphite,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (!isPremium) ...[
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: FilledButton(
                                    onPressed: openPremium,
                                    style: FilledButton.styleFrom(
                                      backgroundColor: AppColors.ink,
                                      foregroundColor: AppColors.onInk,
                                    ),
                                    child: Text(tr.app.premiumOpenButton),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (!kReleaseMode) ...[
                          SettingsSectionHeader(
                            title: 'Debug',
                          ),
                          const SizedBox(height: 8),
                          SettingsSwitchCard(
                            title: 'Force Premium',
                            subtitle: 'Toggle local premium state for testing.',
                            icon: Icons.bug_report_outlined,
                            value: isPremium,
                            onChanged: (value) {
                              context
                                  .read<PremiumBloc>()
                                  .add(PremiumDebugSetLocal(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed: () => ReminderService.instance
                                .scheduleDebugReminder(),
                            icon: const Icon(Icons.notifications_outlined),
                            label: const Text('Send reminder in 10 s'),
                          ),
                          const SizedBox(height: 12),
                        ],
                        SettingsSectionHeader(
                          title: tr.app.settingsGeneralSection,
                        ),
                        const SizedBox(height: 8),
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
                        DropdownTileSetting<ThemeMode>(
                          title: tr.app.settingsThemeTitle,
                          subtitle: tr.app.settingsThemeSubtitle,
                          currentValue: state.stateData.themeMode,
                          icon: Icons.dark_mode_outlined,
                          items: [
                            DropdownMenuItem(
                              value: ThemeMode.system,
                              child: Text(tr.app.settingsThemeSystem),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.light,
                              child: Text(tr.app.settingsThemeLight),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.dark,
                              child: Text(tr.app.settingsThemeDark),
                            ),
                          ],
                          onChanged: (ThemeMode? mode) {
                            if (mode != null) {
                              context
                                  .read<SettingsBloc>()
                                  .add(ChangeThemeMode(mode: mode));
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
                        SettingsSwitchCard(
                          title: tr.app.settingsReminderTitle,
                          subtitle: tr.app.settingsReminderSubtitle,
                          icon: Icons.notifications_active_outlined,
                          value: state.stateData.reminderEnabled,
                          onChanged: (value) {
                            context.read<SettingsBloc>().add(
                                  ChangeReminderEnabled(enabled: value),
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
                        SettingsSectionHeader(
                          title: tr.app.settingsAiModelsSection,
                          onInfoPressed: () =>
                              Dialogs.showAiInfoDialog(context),
                        ),
                        const SizedBox(height: 8),
                        PremiumLockedWrapper(
                          locked: !isPremium,
                          onTapLocked: onLockedTap,
                          child: SettingsSwitchCard(
                            title: tr.app.settingsUseModelHiraganaTitle,
                            subtitle: tr.app.settingsUseModelHiraganaSubtitle,
                            icon: Icons.smart_toy_outlined,
                            value: state.stateData.useModelHiragana,
                            onChanged: (value) {
                              context.read<SettingsBloc>().add(
                                    ChangeUseModelHiragana(enabled: value),
                                  );
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        PremiumLockedWrapper(
                          locked: !isPremium,
                          onTapLocked: onLockedTap,
                          child: SettingsSwitchCard(
                            title: tr.app.settingsUseModelKatakanaTitle,
                            subtitle: tr.app.settingsUseModelKatakanaSubtitle,
                            icon: Icons.smart_toy_outlined,
                            value: state.stateData.useModelKatakana,
                            onChanged: (value) {
                              context.read<SettingsBloc>().add(
                                    ChangeUseModelKatakana(enabled: value),
                                  );
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        PremiumLockedWrapper(
                          locked: !isPremium,
                          onTapLocked: onLockedTap,
                          child: SettingsSwitchCard(
                            title: tr.app.settingsUseModelKanjiTitle,
                            subtitle: tr.app.settingsUseModelKanjiSubtitle,
                            icon: Icons.smart_toy_outlined,
                            value: state.stateData.useModelKanji,
                            onChanged: (value) {
                              context.read<SettingsBloc>().add(
                                    ChangeUseModelKanji(enabled: value),
                                  );
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        SettingsSectionHeader(
                          title: tr.app.settingsKanjiFilterSection,
                        ),
                        const SizedBox(height: 8),
                        // N5 and "all" are free; single N4–N1 levels are
                        // premium.
                        DropdownTileSetting(
                          title: tr.app.settingsKanjiJlptTitle,
                          subtitle: tr.app.settingsKanjiJlptSubtitle,
                          currentValue: state.stateData.kanjiJlptFilter,
                          icon: Icons.filter_alt_outlined,
                          items: _jlptItems(context, isPremium: isPremium),
                          onChanged: (String? newValue) {
                            if (newValue == null) return;
                            if (!isPremium && !freeJlptFilters.contains(newValue)) {
                              onLockedTap();
                              return;
                            }
                            context.read<SettingsBloc>().add(
                                  ChangeKanjiJlptFilter(filter: newValue),
                                );
                          },
                        ),
                        const SizedBox(height: 12),
                        SettingsSectionHeader(
                          title: tr.app.settingsDataSection,
                        ),
                        const SizedBox(height: 8),
                        PremiumLockedWrapper(
                          locked: !isPremium,
                          onTapLocked: onLockedTap,
                          child: SettingsBackupCard(
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
                            onImport: () async {
                              final bool confirmed = await Dialogs
                                  .showImportBackupConfirmDialog(context);
                              if (!confirmed || !context.mounted) return;
                              context
                                  .read<SettingsBloc>()
                                  .add(ImportStatsRequested());
                            },
                          ),
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
  return languages.entries
      .map(
        (entry) => DropdownMenuItem<String>(
          value: entry.key,
          child: Text(entry.value),
        ),
      )
      .toList();
}

List<DropdownMenuItem<String>> _jlptItems(
  BuildContext context, {
  required bool isPremium,
}) {
  final tr = context.t;
  Widget label(String value, String text) {
    final bool locked = !isPremium && !freeJlptFilters.contains(value);
    if (!locked) return Text(text);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: TextStyle(color: AppColors.slate)),
        const SizedBox(width: 4),
        Icon(Icons.lock_outline, size: 14, color: AppColors.slate),
      ],
    );
  }

  return [
    DropdownMenuItem(value: 'all', child: label('all', tr.app.filterAll)),
    for (final level in ['n5', 'n4', 'n3', 'n2', 'n1'])
      DropdownMenuItem(value: level, child: label(level, level.toUpperCase())),
  ];
}
