import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/pages/stats/widgets/bar_chart.dart';
import 'package:kana_master/pages/stats/widgets/time_series_bar_chart.dart';
import 'package:kana_master/widgets/dialogs.dart';

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
                          foregroundColor: Colors.black),
                      onPressed: () {
                        setState(() {
                          _showBarChart = true;
                        });
                      },
                      child: const Text(
                        'Counter',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !_showBarChart ? jLightBLue : jOrange,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _showBarChart = false;
                        });
                      },
                      child: const Text(
                        'Evolution',
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
                  foregroundColor: Colors.black,
                ),
                onPressed: () => Dialogs.showResetStatsAlert(context),
                child: const Text(
                  "Reset stats",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
