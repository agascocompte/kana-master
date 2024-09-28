import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/test_kana/bloc/test_kana_bloc.dart';

class TestTitle extends StatelessWidget {
  final TestKanaState state;

  const TestTitle({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: state.stateData.testType == TestType.drawingTest
          ? Text(
              'Draw the hiragana: ${hiragana.values.toList()[state.stateData.kanaIndex]}',
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
                  hiragana.keys.toList()[state.stateData.kanaIndex],
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
