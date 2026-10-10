import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/domain/quiz_engine.dart';
import 'package:kana_master/pages/premium/bloc/premium_bloc.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/prediction_overlay.dart';
import 'package:kana_master/pages/test_kana/widgets/session_summary_card.dart';
import 'package:kana_master/pages/test_kana/widgets/test_session_view.dart';
import 'package:kana_master/pages/test_kana/widgets/test_start_card.dart';
import 'package:kana_master/services/ads/interstitial_gate.dart';
import 'package:kana_master/widgets/snackbars.dart';
import 'package:kana_master/i18n/strings.g.dart';

class TestTab extends StatelessWidget {
  final KanaType kanaType;

  /// Kanji to ask about (already filtered by JLPT level).
  final List<KanjiEntry> kanjiEntries;

  /// Every kanji, in the drawing model's class order.
  final List<KanjiEntry> kanjiModelEntries;
  final Map<String, List<String>> kanjiMeanings;

  const TestTab({
    super.key,
    required this.kanaType,
    this.kanjiEntries = const [],
    this.kanjiModelEntries = const [],
    this.kanjiMeanings = const {},
  });

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsBloc>().state.stateData;
    final DifficultyLevel difficulty = settings.difficultyLevel;
    final bool useModel = switch (kanaType) {
      KanaType.hiragana => settings.useModelHiragana,
      KanaType.katakana => settings.useModelKatakana,
      KanaType.kanji => settings.useModelKanji,
    };
    final List<QuizItem> pool = kanaType == KanaType.kanji
        ? QuizEngine.kanjiPool(
            entries: kanjiEntries,
            modelEntries: kanjiModelEntries,
            meanings: kanjiMeanings,
            mode: difficulty == DifficultyLevel.high
                ? KanjiQuizMode.meaning
                : settings.kanjiQuizMode,
          )
        : QuizEngine.kanaPool(kanaType, settings.kanaGroupsFor(kanaType));
    final List<String> modelLabels = switch (kanaType) {
      KanaType.hiragana => hiragana.keys.toList(),
      KanaType.katakana => katakanaModelLabels,
      KanaType.kanji => [for (final e in kanjiModelEntries) e.character],
    };

    return BlocConsumer<TestKanaBloc, TestKanaState>(
      listener: (context, state) => _onStateChanged(context, state),
      builder: (context, state) {
        final String modeLabel = _modeLabel(
          kanaType: kanaType,
          difficulty: difficulty,
          testType: TestKanaBloc.testTypeFor(difficulty),
        );
        if (state is SessionFinished) {
          return SessionSummaryCard(session: state.stateData.session!);
        }
        if (state is TestKanaInitial || state.stateData.session == null) {
          return TestStartCard(
            modeLabel: modeLabel,
            kanaType: kanaType,
            difficulty: difficulty,
            pool: pool,
            useModel: useModel,
            onStart: (selectedPool, isReview) {
              final stats = context
                      .read<StatsBloc>()
                      .state
                      .stateData
                      .itemStatsByType[kanaType] ??
                  const {};
              context.read<TestKanaBloc>().add(StartSession(
                    kanaType: kanaType,
                    difficulty: difficulty,
                    pool: selectedPool,
                    length: settings.sessionLength,
                    useModel: useModel,
                    modelLabels: modelLabels,
                    stats: stats,
                    isReview: isReview,
                  ));
            },
          );
        }
        return Stack(
          children: [
            TestSessionView(
              state: state,
              modeLabel: modeLabel,
              kanaScale: settings.kanaScale,
            ),
            if (state is PredictionInProgress) const PredictionOverlay(),
          ],
        );
      },
    );
  }

  void _onStateChanged(BuildContext context, TestKanaState state) {
    final bool hapticsEnabled =
        context.read<SettingsBloc>().state.stateData.hapticsEnabled;
    if (state is ErrorPredicting) {
      Snackbars.showErrorScaffold(context, state.msg);
    } else if (state is DrawingReportShared) {
      Snackbars.showSuccessScaffold(
        context,
        t.app.testReportThanks,
        visibleDuration: const Duration(milliseconds: 2600),
      );
    } else if (state is DrawingReportError) {
      Snackbars.showErrorScaffold(
        context,
        state.msg.isEmpty ? t.app.testReportError : state.msg,
        visibleDuration: const Duration(milliseconds: 2600),
      );
    } else if (state is AnswerResult) {
      final session = state.stateData.session!;
      context.read<StatsBloc>().add(AddAnswerResult(
            kanaType: session.kanaType,
            isCorrect: state.isCorrect,
            item: state.item.symbol,
          ));
      if (state.isCorrect) {
        if (hapticsEnabled) HapticFeedback.lightImpact();
        Snackbars.showSuccessScaffold(context, t.app.correct);
      } else if (hapticsEnabled) {
        HapticFeedback.mediumImpact();
      }
    } else if (state is SessionFinished) {
      final isPremium = context.read<PremiumBloc>().state.isPremium;
      InterstitialGate.instance.onSessionFinished(isPremium: isPremium);
    }
  }
}

String _modeLabel({
  required KanaType kanaType,
  required DifficultyLevel difficulty,
  required TestType testType,
}) {
  final String script = switch (kanaType) {
    KanaType.hiragana => t.app.scriptHiragana,
    KanaType.katakana => t.app.scriptKatakana,
    KanaType.kanji => t.app.scriptKanji,
  };
  final String difficultyLabel = switch (difficulty) {
    DifficultyLevel.low => t.app.difficultyEasy,
    DifficultyLevel.medium => t.app.difficultyMedium,
    DifficultyLevel.high => t.app.difficultyHard,
  };
  final String mode = testType == TestType.drawingTest
      ? t.app.testModeDrawing
      : t.app.testModeQuiz;
  return '$script - $difficultyLabel - $mode';
}
