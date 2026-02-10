import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/hero_prompt.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class TestTitle extends StatelessWidget {
  final TestKanaState state;
  final Map<String, String> kana;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;
  final double kanaScale;

  const TestTitle({
    super.key,
    required this.state,
    required this.kana,
    required this.kanaType,
    this.kanjiEntries = const [],
    this.kanaScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final double spacing = keyboardOpen ? 14 : 30;
    final double heroScale = keyboardOpen ? kanaScale * 0.92 : kanaScale;
    final String kanaText = _scriptLabel(tr);
    final String drawingLabel = _getDrawingLabel();
    final String promptText = kanaType == KanaType.kanji
        ? tr.app.testKanjiMeaning
        : tr.app.testWhichIs(script: kanaText.toLowerCase());
    final String displaySymbol = _getDisplaySymbol();
    return Padding(
      padding: EdgeInsets.only(bottom: keyboardOpen ? 6 : 10),
      child: state.stateData.testType == TestType.drawingTest
          ? Column(
              children: [
                Text(
                  tr.app.testDrawThe(script: kanaText.toLowerCase()),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                ),
                SizedBox(height: spacing),
                HeroPrompt(
                  text: drawingLabel,
                  background: AppColors.peach,
                  foreground: AppColors.ink,
                  scale: heroScale,
                ),
              ],
            )
          : Column(
              children: [
                Text(
                  promptText,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: spacing),
                HeroPrompt(
                  text: displaySymbol,
                  background: AppColors.peach,
                  foreground: AppColors.ink,
                  scale: heroScale,
                ),
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

  String _scriptLabel(Translations tr) {
    switch (kanaType) {
      case KanaType.hiragana:
        return tr.app.scriptHiragana;
      case KanaType.katakana:
        return tr.app.scriptKatakana;
      case KanaType.kanji:
        return tr.app.scriptKanji;
    }
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
