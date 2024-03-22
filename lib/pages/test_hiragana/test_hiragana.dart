import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/stats/bloc/stats_bloc.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/bloc/test_hiragana_bloc.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/widgets/test_body.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/widgets/test_button.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/widgets/test_title.dart';
import 'package:hiragana_japanesse/widgets/snackbars.dart';

class TestHiraganaTab extends StatelessWidget {
  const TestHiraganaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestHiraganaBloc, TestHiraganaState>(
      listener: (context, state) {
        if (state is ErrorPredictingHiragana) {
          Snackbars.showErrorScaffold(context, state.msg);
        } else if (state is HiraganaWritingSuccess ||
            state is HiraganaSelectedSuccess) {
          context.read<StatsBloc>().add(AddHiraganaSuccess());
          Snackbars.showSuccessScaffold(context, "You got it right!");
          context.read<TestHiraganaBloc>().add(TestNextHiragana());
        } else if (state is HiraganaWritingFail ||
            state is HiraganaSelectedFail) {
          context.read<StatsBloc>().add(AddHiraganaFail());
          Snackbars.showWarningScaffold(context, "Oops, you failed...");
        }
      },
      builder: (context, state) {
        if (state is TestHiraganaInitial) {
          return Center(
              child: TextButton(
            child: const Text("Touch here to begin test."),
            onPressed: () => context.read<TestHiraganaBloc>().add(BeginTest()),
          ));
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: TestTitle(
                  state: state,
                ),
              ),
              Flexible(
                flex: 12,
                child: TestBody(
                  state: state,
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
                        onPressed: () =>
                            context.read<TestHiraganaBloc>().add(ResetTest()),
                      ),
                      if (state.stateData.testType == TestType.drawingTest)
                        TestButton(
                          icon: const Icon(Icons.replay_outlined),
                          onPressed: () => context
                              .read<TestHiraganaBloc>()
                              .add(ClearDrawing()),
                        ),
                      TestButton(
                        icon: const Icon(Icons.check_outlined),
                        backgroundColor: state.stateData.canSubmitAnswer
                            ? jOrange
                            : Colors.grey,
                        opacity: state.stateData.canSubmitAnswer ? 1.0 : 0.5,
                        onPressed: state.stateData.canSubmitAnswer
                            ? () =>
                                state.stateData.testType == TestType.drawingTest
                                    ? context
                                        .read<TestHiraganaBloc>()
                                        .add(CaptureImage())
                                    : context
                                        .read<TestHiraganaBloc>()
                                        .add(CheckAnswer())
                            : null,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
