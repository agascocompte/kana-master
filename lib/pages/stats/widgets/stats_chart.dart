import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsChart extends StatelessWidget {
  final int correctHiraganaCount;
  final int incorrectHiraganaCount;

  const StatsChart({
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
            tooltipBgColor: Colors.grey,
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
                    return const Text('Correct',
                        style: TextStyle(color: Colors.green));
                  case 1:
                    return const Text('Incorrect',
                        style: TextStyle(color: Colors.red));
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
