import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/stats/bloc/stats_bloc.dart';
import 'package:hiragana_japanesse/pages/stats/widgets/bar_chart.dart';
import 'package:hiragana_japanesse/pages/stats/widgets/time_series_bar_chart.dart';
import 'package:hiragana_japanesse/widgets/dialogs.dart';

class StatsTab extends StatefulWidget {
  const StatsTab({super.key});

  @override
  StatsTabState createState() => StatsTabState();
}

class StatsTabState extends State<StatsTab> {
  List<FlSpot> correctSpots = [];
  List<FlSpot> incorrectSpots = [];
  bool _showBarChart = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state) {
        if (state.stateData.correctHiraganaCount > 0 &&
            state.stateData.incorrectHiraganaCount > 0) {
          correctSpots = state.stateData.correctDataMap.entries.map((entry) {
            final xValue = entry.key
                .difference(state.stateData.correctDataMap.keys.first)
                .inDays
                .toDouble();
            final yValue = entry.value.toDouble();
            return FlSpot(xValue, yValue);
          }).toList();
          incorrectSpots =
              state.stateData.incorrectDataMap.entries.map((entry) {
            final xValue = entry.key
                .difference(state.stateData.incorrectDataMap.keys.first)
                .inDays
                .toDouble();
            final yValue = entry.value.toDouble();
            return FlSpot(xValue, yValue);
          }).toList();
        }
        return Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _showBarChart ? jLightBLue : jOrange,
                      ),
                      onPressed: () {
                        setState(() {
                          _showBarChart = true;
                        });
                      },
                      child: const Text(
                        'Counter',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !_showBarChart ? jLightBLue : jOrange,
                      ),
                      onPressed: () {
                        setState(() {
                          _showBarChart = false;
                        });
                      },
                      child: const Text(
                        'Evolution',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 8,
              child: _showBarChart
                  ? StatsBarChart(
                      correctHiraganaCount:
                          state.stateData.correctHiraganaCount,
                      incorrectHiraganaCount:
                          state.stateData.incorrectHiraganaCount,
                    )
                  : TimeSeriesLineChart(
                      correctSpots: correctSpots,
                      incorrectSpots: incorrectSpots,
                    ),
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: jOrange,
                ),
                onPressed: () => Dialogs.showResetStatsAlert(context),
                child: const Text(
                  "Reset stats",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
