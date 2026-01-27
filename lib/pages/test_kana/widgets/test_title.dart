import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';

class TestTitle extends StatelessWidget {
  final TestKanaState state;
  final Map<String, String> kana;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;

  const TestTitle({
    super.key,
    required this.state,
    required this.kana,
    required this.kanaType,
    this.kanjiEntries = const [],
  });

  @override
  Widget build(BuildContext context) {
    final String kanaText = kanaType == KanaType.hiragana
        ? "hiragana"
        : kanaType == KanaType.katakana
            ? "katakana"
            : "kanji";
    final String drawingLabel = _getDrawingLabel();
    final String promptText = kanaType == KanaType.kanji
        ? "Meaning of this kanji?"
        : "Which is this $kanaText?";
    final String displaySymbol = _getDisplaySymbol();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: state.stateData.testType == TestType.drawingTest
          ? Text(
              'Draw the $kanaText: $drawingLabel',
              style: Theme.of(context).textTheme.headlineSmall)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(promptText,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  displaySymbol,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 30, color: jLightBLue),
                )
              ],
            ),
    );
  }

  String _getDrawingLabel() {
    final int index = state.stateData.kanaIndex;
    if (kanaType == KanaType.kanji) {
      if (index >= 0 && index < kanjiEntries.length) {
        return kanjiEntries[index].character;
      }
      return '';
    }
    if (kanaType == KanaType.katakana) {
      if (index >= 0 && index < katakanaModelLabels.length) {
        final String symbol = katakanaModelLabels[index];
        return kana[symbol] ?? '';
      }
      return '';
    }
    final List<String> symbols = hiragana.keys.toList();
    if (index >= 0 && index < symbols.length) {
      return kana[symbols[index]] ?? '';
    }
    return '';
  }

  String _getDisplaySymbol() {
    final int index = state.stateData.kanaIndex;
    if (kanaType == KanaType.kanji) {
      if (index >= 0 && index < kanjiEntries.length) {
        return kanjiEntries[index].character;
      }
      return '';
    }
    return kana.keys.toList()[index];
  }
}
