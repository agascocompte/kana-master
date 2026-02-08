import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/prediction_overlay.dart';
import 'package:kana_master/pages/test_kana/widgets/test_session_view.dart';
import 'package:kana_master/pages/test_kana/widgets/test_start_card.dart';
import 'package:kana_master/widgets/snackbars.dart';
import 'package:kana_master/i18n/strings.g.dart';

class TestTab extends StatelessWidget {
  final KanaType kanaType;
  final Map<String, String> kana;
  final List<KanjiEntry> kanjiEntries;
  final Map<String, List<String>> kanjiMeanings;
  final DifficultyLevel difficultyLevel;
  final double kanaScale;

  const TestTab({
    super.key,
    required this.kanaType,
    required this.kana,
    this.kanjiEntries = const [],
    this.kanjiMeanings = const {},
    required this.difficultyLevel,
    this.kanaScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestKanaBloc, TestKanaState>(
      listener: (context, state) {
        final bool hapticsEnabled =
            context.read<SettingsBloc>().state.stateData.hapticsEnabled;
        if (state is ErrorPredictingHiragana) {
          Snackbars.showErrorScaffold(context, state.msg);
        } else if (state is HiraganaWritingSuccess ||
            state is KanaSelectedSuccess) {
          context.read<StatsBloc>().add(AddAnswerResult(
                kanaType: kanaType,
                isCorrect: true,
              ));
          if (hapticsEnabled) {
            HapticFeedback.lightImpact();
          }
          Snackbars.showSuccessScaffold(context, t.app.correct);
          context.read<TestKanaBloc>().add(TestNextKana(
                kana: kana,
                kanaType: kanaType,
                kanjiEntries: kanjiEntries,
                kanjiMeanings: kanjiMeanings,
                difficultyLevel: difficultyLevel,
              ));
        } else if (state is HiraganaWritingFail || state is KanaSelectedFail) {
          context.read<StatsBloc>().add(AddAnswerResult(
                kanaType: kanaType,
                isCorrect: false,
              ));
          if (hapticsEnabled) {
            HapticFeedback.mediumImpact();
          }
          Snackbars.showWarningScaffold(context, t.app.oops);
        }
      },
      builder: (context, state) {
        final String modeLabel = _modeLabel(
          kanaType: kanaType,
          difficulty: difficultyLevel,
          testType: state.stateData.testType,
        );
        if (state is TestKanaInitial) {
          return TestStartCard(
              modeLabel: modeLabel,
              kana: kana,
              kanaType: kanaType,
              kanjiEntries: kanjiEntries,
              kanjiMeanings: kanjiMeanings,
              difficultyLevel: difficultyLevel);
        }
        return Stack(
          children: [
            TestSessionView(
              state: state,
              kana: kana,
              kanaType: kanaType,
              kanjiEntries: kanjiEntries,
              kanjiMeanings: kanjiMeanings,
              difficultyLevel: difficultyLevel,
              modeLabel: modeLabel,
              kanaScale: kanaScale,
            ),
            if (state is PredictionInProgress) const PredictionOverlay()
          ],
        );
      },
    );
  }
}

String _modeLabel({
  required KanaType kanaType,
  required DifficultyLevel difficulty,
  required TestType testType,
}) {
  final String script = () {
    switch (kanaType) {
      case KanaType.hiragana:
        return t.app.scriptHiragana;
      case KanaType.katakana:
        return t.app.scriptKatakana;
      case KanaType.kanji:
        return t.app.scriptKanji;
    }
  }();
  final String difficultyLabel = () {
    switch (difficulty) {
      case DifficultyLevel.low:
        return t.app.difficultyEasy;
      case DifficultyLevel.medium:
        return t.app.difficultyMedium;
      case DifficultyLevel.high:
        return t.app.difficultyHard;
    }
  }();
  final String mode = testType == TestType.drawingTest
      ? t.app.testModeDrawing
      : t.app.testModeQuiz;
  return '$script - $difficultyLabel - $mode';
}
