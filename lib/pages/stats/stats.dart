import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/stats/bloc/stats_bloc.dart';
import 'package:hiragana_japanesse/pages/stats/widgets/stats_chart.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state) {
        if (state.stateData.correctHiraganaCount > 0 &&
            state.stateData.incorrectHiraganaCount > 0) {
          return Column(
            children: [
              Flexible(
                flex: 9,
                child: StatsChart(
                  correctHiraganaCount: state.stateData.correctHiraganaCount,
                  incorrectHiraganaCount:
                      state.stateData.incorrectHiraganaCount,
                ),
              ),
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: jOrange,
                  ),
                  onPressed: () => context.read<StatsBloc>().add(ResetStats()),
                  child: const Text(
                    "Reset stats",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          );
        } else {
          return const Center(child: Text('There is no data yet.'));
        }
      },
    );
  }
}
