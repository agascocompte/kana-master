import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/stats_summary.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/widgets/dialogs.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state) {
        final KanaType selectedType = state.stateData.selectedKanaType;
        final StatsSummary summary =
            state.stateData.summaries[selectedType] ??
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
            _buildActivityDays(correctMap, incorrectMap, 14);
        final List<FlSpot> correctSpots =
            _buildSpots(correctMap, useIndex: true);
        final List<FlSpot> incorrectSpots =
            _buildSpots(incorrectMap, useIndex: true);

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0B1F2A),
                Color(0xFF0E2E3D),
                Color(0xFF0A1620),
              ],
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
                  const Text(
                    'Statistics',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Consistency, accuracy, and momentum by kana type.',
                    style: TextStyle(
                      color: Color(0xFFB3C8D6),
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
                    _EmptyStatsCard(onReset: () {
                      Dialogs.showResetStatsAlert(context);
                    })
                  else ...[
                    Row(
                      children: [
                        Expanded(
                          child: _MetricCard(
                            label: 'Accuracy',
                            value:
                                '${(summary.accuracy * 100).toStringAsFixed(1)}%',
                            subtitle:
                                '${summary.correct} / ${summary.total} correct',
                            accent: jOrange,
                            icon: Icons.auto_graph,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _MetricCard(
                            label: 'Streak',
                            value: '${summary.currentStreak} days',
                            subtitle: 'Best ${summary.bestStreak} days',
                            accent: jLightBLue,
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
                            label: 'Last 7 days',
                            value: '${summary.last7DaysCount}',
                            subtitle: 'sessions',
                            accent: const Color(0xFF67D2B4),
                            icon: Icons.bolt,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _MetricCard(
                            label: 'Last 30 days',
                            value: '${summary.last30DaysCount}',
                            subtitle: 'sessions',
                            accent: const Color(0xFFE2C044),
                            icon: Icons.calendar_month,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(
                      title: 'Daily activity',
                      subtitle: 'Last 14 days',
                      child: _ActivityStrip(days: activityDays),
                    ),
                    const SizedBox(height: 16),
                    _SectionCard(
                      title: 'Evolution',
                      subtitle: 'Correct vs incorrect',
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
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: jOrange,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () => Dialogs.showResetStatsAlert(context),
                      icon: const Icon(Icons.delete_sweep),
                      label: const Text('Reset stats'),
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
                  color: isSelected ? accent : const Color(0xFF122432),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? accent : const Color(0xFF294659),
                    width: 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: accent.withAlpha(80),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          )
                        ]
                      : [],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _labelForType(type),
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${(summary.accuracy * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        color: isSelected ? Colors.black : accent,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '${summary.total} attempts',
                      style: TextStyle(
                        color: isSelected
                            ? Colors.black.withAlpha(140)
                            : const Color(0xFF8FB1C7),
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
        color: const Color(0xFF122432),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF294659)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accent.withAlpha(40),
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
                    color: Color(0xFFB3C8D6),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF8FB1C7),
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
        color: const Color(0xFF101D27),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF294659)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF8FB1C7),
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
      return const Text(
        'No activity yet.',
        style: TextStyle(color: Color(0xFF8FB1C7)),
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
                    color: day.count > 0
                        ? const Color(0xFF67D2B4)
                        : const Color(0xFF223646),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  day.label,
                  style: const TextStyle(
                    color: Color(0xFF8FB1C7),
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
      return const Center(
        child: Text(
          'No evolution data yet.',
          style: TextStyle(color: Color(0xFF8FB1C7)),
        ),
      );
    }
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.white.withAlpha(15),
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
            color: const Color(0xFF67D2B4),
            barWidth: 3,
            isCurved: true,
            belowBarData: BarAreaData(
              show: true,
              color: const Color(0xFF67D2B4).withAlpha(80),
            ),
          ),
          LineChartBarData(
            spots: incorrectSpots,
            color: const Color(0xFFFF6B6B),
            barWidth: 3,
            isCurved: true,
            belowBarData: BarAreaData(
              show: true,
              color: const Color(0xFFFF6B6B).withAlpha(80),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyStatsCard extends StatelessWidget {
  final VoidCallback onReset;

  const _EmptyStatsCard({required this.onReset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF122432),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF294659)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'No stats yet',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Complete a few tests to unlock streaks and performance graphs.',
            style: TextStyle(color: Color(0xFF8FB1C7)),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFF294659)),
            ),
            onPressed: onReset,
            icon: const Icon(Icons.delete_sweep),
            label: const Text('Reset stats'),
          ),
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
  Map<DateTime, int> correctMap,
  Map<DateTime, int> incorrectMap,
  int days,
) {
  final now = DateTime.now();
  final List<_ActivityDay> result = [];
  for (int i = days - 1; i >= 0; i--) {
    final day = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: i));
    final count = _countForDate(correctMap, day) +
        _countForDate(incorrectMap, day);
    result.add(_ActivityDay(
      label: _weekdayLabel(day.weekday),
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
      return 'Hiragana';
    case KanaType.katakana:
      return 'Katakana';
    case KanaType.kanji:
      return 'Kanji';
  }
}

Color _accentForType(KanaType type) {
  switch (type) {
    case KanaType.hiragana:
      return jOrange;
    case KanaType.katakana:
      return const Color(0xFF67D2B4);
    case KanaType.kanji:
      return const Color(0xFFE2C044);
  }
}

String _weekdayLabel(int weekday) {
  const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  return labels[(weekday - 1).clamp(0, labels.length - 1)];
}
