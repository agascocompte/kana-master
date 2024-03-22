import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/bloc/test_hiragana_bloc.dart';

class TestTitle extends StatelessWidget {
  final TestHiraganaState state;

  const TestTitle({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: state.stateData.testType == TestType.drawingTest
          ? Text(
              'Draw the hiragana: ${hiraganas.values.toList()[state.stateData.hiraganaIndex]}',
              style: Theme.of(context).textTheme.headlineSmall)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Which is this hiragana?",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  hiraganas.keys.toList()[state.stateData.hiraganaIndex],
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 30, color: jLightBLue),
                )
              ],
            ),
    );
  }
}
