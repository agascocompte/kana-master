import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TimeSeriesLineChart extends StatelessWidget {
  final List<FlSpot> correctSpots;
  final List<FlSpot> incorrectSpots;

  const TimeSeriesLineChart({
    super.key,
    required this.correctSpots,
    required this.incorrectSpots,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.white70,
        )),
        lineBarsData: [
          LineChartBarData(
            spots: correctSpots,
            color: Colors.green,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withAlpha(128),
            ),
          ),
          LineChartBarData(
            spots: incorrectSpots,
            color: Colors.red,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.red.withAlpha(128),
            ),
          ),
        ],
      ),
    );
  }
}
