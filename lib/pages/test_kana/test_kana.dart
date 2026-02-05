import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/test_body.dart';
import 'package:kana_master/pages/test_kana/widgets/test_button.dart';
import 'package:kana_master/pages/test_kana/widgets/test_title.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/widgets/snackbars.dart';
import 'package:kana_master/i18n/strings.g.dart';

class TestTab extends StatelessWidget {
  final KanaType kanaType;
  final Map<String, String> kana;
  final List<KanjiEntry> kanjiEntries;
  final Map<String, List<String>> kanjiMeanings;
  final DifficultyLevel difficultyLevel;

  const TestTab({
    super.key,
    required this.kanaType,
    required this.kana,
    this.kanjiEntries = const [],
    this.kanjiMeanings = const {},
    required this.difficultyLevel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestKanaBloc, TestKanaState>(
      listener: (context, state) {
        if (state is ErrorPredictingHiragana) {
          Snackbars.showErrorScaffold(context, state.msg);
        } else if (state is HiraganaWritingSuccess ||
            state is KanaSelectedSuccess) {
          context.read<StatsBloc>().add(AddAnswerResult(
                kanaType: kanaType,
                isCorrect: true,
              ));
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
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.sand),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(12),
                    blurRadius: 12,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.flash_on_outlined,
                    size: 36,
                    color: AppColors.ink,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    modeLabel,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    t.app.practiceStartSubtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.slate,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => context.read<TestKanaBloc>().add(
                          BeginTest(
                            kana: kana,
                            kanaType: kanaType,
                            kanjiEntries: kanjiEntries,
                            kanjiMeanings: kanjiMeanings,
                            difficultyLevel: difficultyLevel,
                          ),
                        ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.ink,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    icon: const Icon(Icons.play_arrow),
                    label: Text(t.app.beginSession),
                  ),
                ],
              ),
            ),
          );
        }
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.sand),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.sand,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.bolt,
                            color: AppColors.ink,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                modeLabel,
                                style: const TextStyle(
                                  color: AppColors.ink,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                t.app.testStayFocused,
                                style: const TextStyle(
                                  color: AppColors.slate,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                      child: Container(
                        key: ValueKey<int>(state.stateData.kanaIndex),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: AppColors.sand),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(12),
                              blurRadius: 12,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            TestTitle(
                              state: state,
                              kana: kana,
                              kanaType: kanaType,
                              kanjiEntries: kanjiEntries,
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: TestBody(
                                state: state,
                                kana: kana,
                                kanaType: kanaType,
                                kanjiEntries: kanjiEntries,
                                kanjiMeanings: kanjiMeanings,
                                difficultyLevel: difficultyLevel,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TestButton(
                                  icon: const Icon(Icons.cancel_outlined),
                                  backgroundColor: AppColors.sand,
                                  iconColor: AppColors.ink,
                                  heroTag: "cancel",
                                  onPressed: () => context
                                      .read<TestKanaBloc>()
                                      .add(ResetTest()),
                                ),
                                if (state.stateData.testType ==
                                    TestType.drawingTest)
                                  TestButton(
                                    icon: const Icon(Icons.replay_outlined),
                                    backgroundColor: AppColors.sand,
                                    iconColor: AppColors.ink,
                                    heroTag: "clear",
                                    onPressed: () => context
                                        .read<TestKanaBloc>()
                                        .add(ClearDrawing()),
                                  ),
                                TestButton(
                                  icon: const Icon(Icons.check_outlined),
                                  heroTag: "submit",
                                  backgroundColor:
                                      state.stateData.canSubmitAnswer
                                          ? AppColors.ink
                                          : AppColors.sand,
                                  iconColor: state.stateData.canSubmitAnswer
                                      ? Colors.white
                                      : AppColors.graphite,
                                  opacity:
                                      state.stateData.canSubmitAnswer ? 1.0 : 0.5,
                                  onPressed: state.stateData.canSubmitAnswer
                                      ? () => state.stateData.testType ==
                                              TestType.drawingTest
                                          ? context
                                              .read<TestKanaBloc>()
                                              .add(CaptureImage())
                                          : context
                                              .read<TestKanaBloc>()
                                              .add(CheckAnswer(
                                                kanaType: kanaType,
                                                difficultyLevel:
                                                    difficultyLevel,
                                                kana: kana,
                                              ))
                                      : null,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (state is PredictionInProgress)
              Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                color: Colors.black.withAlpha(128),
                child: const CircularProgressIndicator(
                  color: jOrange,
                ),
              )
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
