import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/bloc/test_hiragana_bloc.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/widgets/drawing_board.dart';

class TestHiraganaTab extends StatelessWidget {
  const TestHiraganaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestHiraganaBloc, TestHiraganaState>(
      builder: (context, state) {
        if (state is TestHiraganaInitial) {
          return Center(
              child: TextButton(
            child: const Text("Touch here to begin test."),
            onPressed: () => context.read<TestHiraganaBloc>().add(BeginTest()),
          ));
        } else if (state is TestHiraganaDraw) {
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
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: constraints.maxHeight,
                                  child: const DrawingBoard(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 20,
                          bottom: 20,
                          child: FloatingActionButton(
                            backgroundColor: jOrange,
                            elevation: 4.0,
                            onPressed: () => context
                                .read<TestHiraganaBloc>()
                                .add(BeginTest()),
                            child: const Icon(Icons.check),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is TestHiraganaEvaluation) {
          return Text("Evaluating");
        } else {
          return Center(child: Text('Estado no reconocido.'));
        }
      },
    );
  }
}
