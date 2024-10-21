import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/stats/bloc/stats_bloc.dart';
import 'package:hiragana_japanesse/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:hiragana_japanesse/pages/test_kana/widgets/test_body.dart';
import 'package:hiragana_japanesse/pages/test_kana/widgets/test_button.dart';
import 'package:hiragana_japanesse/pages/test_kana/widgets/test_title.dart';
import 'package:hiragana_japanesse/widgets/snackbars.dart';

class TestTab extends StatelessWidget {
  final Map<String, String> kana;
  final DifficultyLevel difficultyLevel;

  const TestTab({
    super.key,
    required this.kana,
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
          context.read<StatsBloc>().add(AddHiraganaSuccess());
          Snackbars.showSuccessScaffold(context, "You got it right!");
          context.read<TestKanaBloc>().add(TestNextKana(
                kana: kana,
                difficultyLevel: difficultyLevel,
              ));
        } else if (state is HiraganaWritingFail || state is KanaSelectedFail) {
          context.read<StatsBloc>().add(AddHiraganaFail());
          Snackbars.showWarningScaffold(context, "Oops, you failed...");
        }
      },
      builder: (context, state) {
        if (state is TestKanaInitial) {
          return Center(
              child: TextButton(
            child: const Text(
              "Touch here to begin test.",
              style: TextStyle(color: jDarkBLue),
            ),
            onPressed: () => context.read<TestKanaBloc>().add(BeginTest(
                  kana: kana,
                  difficultyLevel: difficultyLevel,
                )),
          ));
        } else {
          return Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
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
                child: Column(
                  key: ValueKey<int>(state.stateData.kanaIndex),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: TestTitle(
                        state: state,
                        kana: kana,
                      ),
                    ),
                    Flexible(
                      flex: 12,
                      child: TestBody(
                        state: state,
                        kana: kana,
                        difficultyLevel: difficultyLevel,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TestButton(
                              icon: const Icon(Icons.cancel_outlined),
                              heroTag: "cancel",
                              onPressed: () =>
                                  context.read<TestKanaBloc>().add(ResetTest()),
                            ),
                            if (state.stateData.testType ==
                                TestType.drawingTest)
                              TestButton(
                                icon: const Icon(Icons.replay_outlined),
                                heroTag: "clear",
                                onPressed: () => context
                                    .read<TestKanaBloc>()
                                    .add(ClearDrawing()),
                              ),
                            TestButton(
                              icon: const Icon(Icons.check_outlined),
                              heroTag: "submit",
                              backgroundColor: state.stateData.canSubmitAnswer
                                  ? jOrange
                                  : Colors.grey,
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
                                            difficultyLevel: difficultyLevel,
                                            kana: kana,
                                          ))
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (state is PredictionInProgress)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.5),
                  child: const CircularProgressIndicator(
                    color: jOrange,
                  ),
                )
            ],
          );
        }
      },
    );
  }
}
