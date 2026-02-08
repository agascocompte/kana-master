import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/activity_day.dart';
import 'package:kana_master/domain/models/stats_summary.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/pages/stats/widgets/activity_strip.dart';
import 'package:kana_master/pages/stats/widgets/empty_stats_card.dart';
import 'package:kana_master/pages/stats/widgets/evolution_chart.dart';
import 'package:kana_master/pages/stats/widgets/kana_type_switcher.dart';
import 'package:kana_master/pages/stats/widgets/metric_card.dart';
import 'package:kana_master/pages/stats/widgets/section_card.dart';
import 'package:kana_master/widgets/dialogs.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state) {
        final KanaType selectedType = state.stateData.selectedKanaType;
        final StatsSummary summary =
            state.stateData.summaries[selectedType] ?? StatsSummary.zero();
        final Map<DateTime, int> correctMap =
            state.stateData.correctDataByType[selectedType] ?? {};
        final Map<DateTime, int> incorrectMap =
            state.stateData.incorrectDataByType[selectedType] ?? {};
        final List<ActivityDay> activityDays =
            _buildActivityDays(context, correctMap, incorrectMap, 14);
        final List<FlSpot> correctSpots =
            _buildSpots(correctMap, useIndex: true);
        final List<FlSpot> incorrectSpots =
            _buildSpots(incorrectMap, useIndex: true);

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.mist, AppColors.sand],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.app.statistics,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    t.app.statisticsSubtitle,
                    style: const TextStyle(
                      color: AppColors.slate,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  KanaTypeSwitcher(
                    selectedType: selectedType,
                    onSelected: (type) => context
                        .read<StatsBloc>()
                        .add(StatsKanaTypeChanged(type)),
                    summaries: state.stateData.summaries,
                  ),
                  const SizedBox(height: 20),
                  if (summary.total == 0)
                    const EmptyStatsCard()
                  else ...[
                    Row(
                      children: [
                        Expanded(
                          child: MetricCard(
                            label: t.app.statsAccuracy,
                            value:
                                '${(summary.accuracy * 100).toStringAsFixed(1)}%',
                            subtitle: t.app.statsCorrect(
                                correct: summary.correct, total: summary.total),
                            accent: AppColors.coral,
                            icon: Icons.auto_graph,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: MetricCard(
                            label: t.app.statsStreak,
                            value: t.app
                                .statsStreakDays(days: summary.currentStreak),
                            subtitle: t.app.statsBest(days: summary.bestStreak),
                            accent: AppColors.teal,
                            icon: Icons.local_fire_department,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: MetricCard(
                            label: t.app.statsLast7,
                            value: '${summary.last7DaysCount}',
                            subtitle: t.app.statsSessions,
                            accent: AppColors.lime,
                            icon: Icons.bolt,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: MetricCard(
                            label: t.app.statsLast30,
                            value: '${summary.last30DaysCount}',
                            subtitle: t.app.statsSessions,
                            accent: AppColors.peach,
                            icon: Icons.calendar_month,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: t.app.statsActivity,
                      subtitle: t.app.statsActivitySubtitle,
                      child: ActivityStrip(days: activityDays),
                    ),
                    const SizedBox(height: 16),
                    SectionCard(
                      title: t.app.statsEvolution,
                      subtitle: t.app.statsEvolutionSubtitle,
                      child: SizedBox(
                        height: 220,
                        child: EvolutionChart(
                          correctSpots: correctSpots,
                          incorrectSpots: incorrectSpots,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.ink,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () => Dialogs.showResetStatsAlert(context),
                      icon: const Icon(Icons.delete_sweep),
                      label: Text(t.app.statsReset),
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

List<ActivityDay> _buildActivityDays(
  BuildContext context,
  Map<DateTime, int> correctByDay,
  Map<DateTime, int> incorrectByDay,
  int days,
) {
  final locale = MaterialLocalizations.of(context);
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  return [
    for (int i = days - 1; i >= 0; i--)
      () {
        final day = today.subtract(Duration(days: i));
        final count = (correctByDay[day] ?? 0) + (incorrectByDay[day] ?? 0);
        return ActivityDay(
          label: _weekdayLabel(locale, day.weekday),
          count: count,
        );
      }(),
  ];
}

List<FlSpot> _buildSpots(
  Map<DateTime, int> dataMap, {
  bool useIndex = false,
}) {
  if (dataMap.isEmpty) return [];
  final entries = dataMap.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));
  if (useIndex) {
    return [
      for (int i = 0; i < entries.length; i++)
        FlSpot(i.toDouble(), entries[i].value.toDouble()),
    ];
  }
  final firstKey = entries.first.key;
  return entries.map((entry) {
    final xValue = entry.key.difference(firstKey).inDays.toDouble();
    final yValue = entry.value.toDouble();
    return FlSpot(xValue, yValue);
  }).toList();
}

String _weekdayLabel(MaterialLocalizations locale, int weekday) {
  final labels = locale.narrowWeekdays;
  return labels[(weekday - 1).clamp(0, labels.length - 1)];
}
