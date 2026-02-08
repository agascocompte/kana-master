import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/theme/app_theme.dart';

class EvolutionChart extends StatelessWidget {
  final List<FlSpot> correctSpots;
  final List<FlSpot> incorrectSpots;

  const EvolutionChart({
    super.key,
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
