import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';

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
    final String drawingRomaji =
        _getDrawingRomaji(kana, state.stateData.kanaIndex);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: state.stateData.testType == TestType.drawingTest
          ? Text(
              'Draw the $kanaText: $drawingRomaji',
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

  String _getDrawingRomaji(Map<String, String> kana, int modelIndex) {
    if (kana == katakana) {
      if (modelIndex >= 0 && modelIndex < katakanaModelLabels.length) {
        final String symbol = katakanaModelLabels[modelIndex];
        return kana[symbol] ?? '';
      }
      return '';
    }
    final List<String> symbols = hiragana.keys.toList();
    if (modelIndex >= 0 && modelIndex < symbols.length) {
      return kana[symbols[modelIndex]] ?? '';
    }
    return '';
  }
}
