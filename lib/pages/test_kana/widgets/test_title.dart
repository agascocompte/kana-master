import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/test_kana/bloc/test_kana_bloc.dart';

class TestTitle extends StatelessWidget {
  final TestKanaState state;
  final Map<String, String> kana;

  const TestTitle({
    super.key,
    required this.state,
    required this.kana,
  });

  @override
  Widget build(BuildContext context) {
    final String kanaText = kana == hiragana ? "hiragana" : "katakana";
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: state.stateData.testType == TestType.drawingTest
          ? Text(
              'Draw the hiragana: ${hiragana.values.toList()[state.stateData.kanaIndex]}',
              style: Theme.of(context).textTheme.headlineSmall)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Which is this $kanaText?",
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  kana.keys.toList()[state.stateData.kanaIndex],
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
