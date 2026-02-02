import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/pages/stats/widgets/bar_chart.dart';
import 'package:kana_master/pages/stats/widgets/time_series_bar_chart.dart';
import 'package:kana_master/widgets/dialogs.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state) {
        List<FlSpot> buildSpots(Map<DateTime, int> dataMap) {
          if (dataMap.isEmpty) return [];
          final firstKey = dataMap.keys.first;
          return dataMap.entries.map((entry) {
            final xValue = entry.key.difference(firstKey).inDays.toDouble();
            final yValue = entry.value.toDouble();
            return FlSpot(xValue, yValue);
          }).toList();
        }

        final List<FlSpot> correctSpots =
            buildSpots(state.stateData.correctDataMap);
        final List<FlSpot> incorrectSpots =
            buildSpots(state.stateData.incorrectDataMap);
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
                          backgroundColor: state.stateData.showBarChart
                              ? jLightBLue
                              : jOrange,
                          foregroundColor: Colors.black),
                      onPressed: () {
                        context
                            .read<StatsBloc>()
                            .add(StatsViewChanged(true));
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
                        backgroundColor: !state.stateData.showBarChart
                            ? jLightBLue
                            : jOrange,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        context
                            .read<StatsBloc>()
                            .add(StatsViewChanged(false));
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
              child: state.stateData.showBarChart
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
