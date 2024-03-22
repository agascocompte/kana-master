import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/stats/bloc/stats_bloc.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/bloc/test_hiragana_bloc.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/widgets/drawing_board.dart';
import 'package:hiragana_japanesse/widgets/snackbars.dart';

class TestHiraganaTab extends StatelessWidget {
  const TestHiraganaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestHiraganaBloc, TestHiraganaState>(
      listener: (context, state) {
        if (state is ErrorPredictingHiragana) {
          Snackbars.showErrorScaffold(context, state.msg);
        } else if (state is HiraganaWritingSuccess) {
          context.read<StatsBloc>().add(AddHiraganaSuccess());
          Snackbars.showSuccessScaffold(context, state.msg);
          context.read<TestHiraganaBloc>().add(TestNextHiragana());
        } else if (state is HiraganaWritingFail) {
          context.read<StatsBloc>().add(AddHiraganaFail());
          Snackbars.showWarningScaffold(context, state.msg);
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
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    'Draw the hiragana: ${hiraganas.values.toList()[state.stateData.hiraganaIndex]}',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              Flexible(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              child: FittedBox(
                                child: Container(
                                  color:
                                      const Color.fromARGB(77, 238, 238, 238),
                                  width: MediaQuery.of(context).size.width,
                                  height: constraints.maxHeight - 100,
                                  child: const DrawingBoard(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 20,
                          bottom: 20,
                          child: FloatingActionButton(
                            backgroundColor: jOrange,
                            elevation: 4.0,
                            onPressed: () => context
                                .read<TestHiraganaBloc>()
                                .add(ResetTest()),
                            child: const Icon(Icons.cancel_outlined),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 0,
                          left: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: FloatingActionButton(
                              backgroundColor: jOrange,
                              elevation: 4.0,
                              onPressed: () => context
                                  .read<TestHiraganaBloc>()
                                  .add(ClearDrawing()),
                              child: const Icon(Icons.replay_outlined),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          bottom: 20,
                          child: FloatingActionButton(
                            backgroundColor: jOrange,
                            elevation: 4.0,
                            onPressed: () => context
                                .read<TestHiraganaBloc>()
                                .add(CaptureImage()),
                            child: const Icon(Icons.check_outlined),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
