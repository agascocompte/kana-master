import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:kana_master/i18n/strings.g.dart';

class StatsBarChart extends StatelessWidget {
  final int correctHiraganaCount;
  final int incorrectHiraganaCount;

  const StatsBarChart({
    super.key,
    required this.correctHiraganaCount,
    required this.incorrectHiraganaCount,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: max(
            correctHiraganaCount.toDouble(), incorrectHiraganaCount.toDouble()),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => Colors.white70,
          ),
          touchCallback: (FlTouchEvent event, barTouchResponse) {},
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                switch (value.toInt()) {
                  case 0:
                    return Text(t.app.statsCorrectLabel,
                        style: const TextStyle(color: Colors.green));
                  case 1:
                    return Text(t.app.statsIncorrectLabel,
                        style: const TextStyle(color: Colors.red));
                  default:
                    return const Text('');
                }
              },
              reservedSize: 40,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: correctHiraganaCount.toDouble(),
                color: Colors.green,
                width: 22,
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: incorrectHiraganaCount.toDouble(),
                color: Colors.red,
                width: 22,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
