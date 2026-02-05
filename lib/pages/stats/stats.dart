import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/stats_summary.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
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
        final StatsSummary summary = state.stateData.summaries[selectedType] ??
            StatsSummary(
              correct: 0,
              incorrect: 0,
              total: 0,
              accuracy: 0,
              currentStreak: 0,
              bestStreak: 0,
              last7DaysCount: 0,
              last30DaysCount: 0,
              lastActiveDate: null,
            );
        final Map<DateTime, int> correctMap =
            state.stateData.correctDataByType[selectedType] ?? {};
        final Map<DateTime, int> incorrectMap =
            state.stateData.incorrectDataByType[selectedType] ?? {};
        final List<_ActivityDay> activityDays =
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
                  _KanaTypeSwitcher(
                    selectedType: selectedType,
                    onSelected: (type) => context
                        .read<StatsBloc>()
                        .add(StatsKanaTypeChanged(type)),
                    summaries: state.stateData.summaries,
                  ),
                  const SizedBox(height: 20),
                  if (summary.total == 0)
                    _EmptyStatsCard()
                  else ...[
                    Row(
                      children: [
                        Expanded(
                          child: _MetricCard(
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
                          child: _MetricCard(
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
                          child: _MetricCard(
                            label: t.app.statsLast7,
                            value: '${summary.last7DaysCount}',
                            subtitle: t.app.statsSessions,
                            accent: AppColors.lime,
                            icon: Icons.bolt,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _MetricCard(
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
                    _SectionCard(
                      title: t.app.statsActivity,
                      subtitle: t.app.statsActivitySubtitle,
                      child: _ActivityStrip(days: activityDays),
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(
                      title: t.app.statsEvolution,
                      subtitle: t.app.statsEvolutionSubtitle,
                      child: SizedBox(
                        height: 220,
                        child: _EvolutionChart(
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

class _KanaTypeSwitcher extends StatelessWidget {
  final KanaType selectedType;
  final ValueChanged<KanaType> onSelected;
  final Map<KanaType, StatsSummary> summaries;

  const _KanaTypeSwitcher({
    required this.selectedType,
    required this.onSelected,
    required this.summaries,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: KanaType.values.map((type) {
        final StatsSummary summary = summaries[type] ??
            StatsSummary(
              correct: 0,
              incorrect: 0,
              total: 0,
              accuracy: 0,
              currentStreak: 0,
              bestStreak: 0,
              last7DaysCount: 0,
              last30DaysCount: 0,
              lastActiveDate: null,
            );
        final bool isSelected = type == selectedType;
        final Color accent = _accentForType(type);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => onSelected(type),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? accent.withAlpha(60) : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? accent : AppColors.sand,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(10),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _labelForType(type),
                      style: TextStyle(
                        color: AppColors.ink,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${(summary.accuracy * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '${summary.total} ${t.app.statsAttempts}',
                      style: TextStyle(
                        color: AppColors.slate,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String subtitle;
  final Color accent;
  final IconData icon;

  const _MetricCard({
    required this.label,
    required this.value,
    required this.subtitle,
    required this.accent,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accent.withAlpha(60),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accent, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.slate,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.slate,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.ink,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.slate,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _ActivityStrip extends StatelessWidget {
  final List<_ActivityDay> days;

  const _ActivityStrip({required this.days});

  @override
  Widget build(BuildContext context) {
    if (days.isEmpty) {
      return Text(
        t.app.statsNoActivity,
        style: const TextStyle(color: AppColors.slate),
      );
    }
    final int maxCount =
        days.map((day) => day.count).fold(0, (a, b) => a > b ? a : b);
    return Row(
      children: days.map((day) {
        final double heightFactor =
            maxCount == 0 ? 0.1 : (day.count / maxCount).clamp(0.1, 1.0);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              children: [
                Container(
                  height: 64 * heightFactor,
                  decoration: BoxDecoration(
                    color: day.count > 0 ? AppColors.teal : AppColors.sand,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  day.label,
                  style: const TextStyle(
                    color: AppColors.slate,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _EvolutionChart extends StatelessWidget {
  final List<FlSpot> correctSpots;
  final List<FlSpot> incorrectSpots;

  const _EvolutionChart({
    required this.correctSpots,
    required this.incorrectSpots,
  });

  @override
  Widget build(BuildContext context) {
    if (correctSpots.isEmpty && incorrectSpots.isEmpty) {
      return Center(
        child: Text(
          t.app.statsNoEvolution,
          style: const TextStyle(color: AppColors.slate),
        ),
      );
    }
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: AppColors.sand,
            strokeWidth: 1,
          ),
        ),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (touchedSpot) => Colors.white70,
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: correctSpots,
            color: AppColors.teal,
            barWidth: 3,
            isCurved: true,
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.teal.withAlpha(80),
            ),
          ),
          LineChartBarData(
            spots: incorrectSpots,
            color: AppColors.coral,
            barWidth: 3,
            isCurved: true,
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.coral.withAlpha(80),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyStatsCard extends StatelessWidget {
  const _EmptyStatsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.app.statsNoDataTitle,
            style: TextStyle(
              color: AppColors.ink,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            t.app.statsNoDataSubtitle,
            style: const TextStyle(color: AppColors.slate),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _ActivityDay {
  final String label;
  final int count;

  _ActivityDay({required this.label, required this.count});
}

List<_ActivityDay> _buildActivityDays(
  BuildContext context,
  Map<DateTime, int> correctMap,
  Map<DateTime, int> incorrectMap,
  int days,
) {
  final locale = MaterialLocalizations.of(context);
  final now = DateTime.now();
  final List<_ActivityDay> result = [];
  for (int i = days - 1; i >= 0; i--) {
    final day =
        DateTime(now.year, now.month, now.day).subtract(Duration(days: i));
    final count =
        _countForDate(correctMap, day) + _countForDate(incorrectMap, day);
    result.add(_ActivityDay(
      label: _weekdayLabel(locale, day.weekday),
      count: count,
    ));
  }
  return result;
}

int _countForDate(Map<DateTime, int> dataMap, DateTime day) {
  final normalized = DateTime(day.year, day.month, day.day);
  for (final entry in dataMap.entries) {
    final key = DateTime(entry.key.year, entry.key.month, entry.key.day);
    if (key == normalized) {
      return entry.value;
    }
  }
  return 0;
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

String _labelForType(KanaType type) {
  switch (type) {
    case KanaType.hiragana:
      return t.app.scriptHiragana;
    case KanaType.katakana:
      return t.app.scriptKatakana;
    case KanaType.kanji:
      return t.app.scriptKanji;
  }
}

Color _accentForType(KanaType type) {
  switch (type) {
    case KanaType.hiragana:
      return AppColors.peach;
    case KanaType.katakana:
      return AppColors.teal;
    case KanaType.kanji:
      return AppColors.sky;
  }
}

String _weekdayLabel(MaterialLocalizations locale, int weekday) {
  final labels = locale.narrowWeekdays;
  return labels[(weekday - 1).clamp(0, labels.length - 1)];
}
