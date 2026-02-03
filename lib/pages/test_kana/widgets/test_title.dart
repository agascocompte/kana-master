import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

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
          ? Column(
              children: [
                Text(
                  'Draw the $kanaText',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.ink,
                      ),
                ),
                const SizedBox(height: 30),
                _HeroPrompt(
                  text: drawingLabel,
                  background: AppColors.peach,
                  foreground: AppColors.ink,
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
                const SizedBox(height: 30),
                _HeroPrompt(
                  text: displaySymbol,
                  background: AppColors.peach,
                  foreground: AppColors.ink,
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

class _HeroPrompt extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;

  const _HeroPrompt({
    required this.text,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: background.withAlpha(80),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 44,
                  color: foreground,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
      ),
    );
  }
}
