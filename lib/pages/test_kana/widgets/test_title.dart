import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/hero_prompt.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class TestTitle extends StatelessWidget {
  final TestKanaState state;
  final double kanaScale;

  const TestTitle({
    super.key,
    required this.state,
    this.kanaScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    final session = state.stateData.session!;
    final QuizItem item = state.stateData.current!;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final double spacing = keyboardOpen ? 10 : 18;
    final double heroScale = keyboardOpen ? kanaScale * 0.9 : kanaScale * 0.95;
    final String script = switch (session.kanaType) {
      KanaType.hiragana => tr.app.scriptHiragana,
      KanaType.katakana => tr.app.scriptKatakana,
      KanaType.kanji => tr.app.scriptKanji,
    };

    final bool drawing = session.testType == TestType.drawingTest;
    final String prompt = drawing
        ? tr.app.testDrawThe(script: script.toLowerCase())
        : session.kanaType != KanaType.kanji
            ? tr.app.testWhichIs(script: script.toLowerCase())
            : item.answerKind == AnswerKind.reading
                ? tr.app.testKanjiReading
                : tr.app.testKanjiMeaning;

    return Padding(
      padding: EdgeInsets.only(bottom: keyboardOpen ? 6 : 10),
      child: Column(
        children: [
          Text(
            prompt,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: spacing),
          HeroPrompt(
            text: drawing ? item.drawPrompt : item.symbol,
            background: AppColors.peach,
            foreground: AppColors.ink,
            scale: heroScale,
          ),
        ],
      ),
    );
  }
}
