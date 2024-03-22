import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/pages/stats/bloc/stats_bloc.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state) {
        return Column(
          children: [
            Center(
              child: Text("Correct: ${state.stateData.correctHiraganaCount}"),
            ),
            Center(
              child:
                  Text("Incorrect: ${state.stateData.incorrectHiraganaCount}"),
            ),
          ],
        );
      },
    );
  }
}
