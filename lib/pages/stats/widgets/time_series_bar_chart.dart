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
        lineBarsData: [
          LineChartBarData(
            spots: correctSpots,
            isCurved: true,
            color: Colors.green,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withOpacity(0.5),
            ),
          ),
          LineChartBarData(
            spots: incorrectSpots,
            isCurved: true,
            color: Colors.red,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.red.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
