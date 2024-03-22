import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/bloc/test_hiragana_bloc.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/widgets/drawing_board.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/widgets/single_choice_test.dart';

class TestBody extends StatelessWidget {
  final TestHiraganaState state;

  const TestBody({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return state.stateData.testType == TestType.drawingTest
        ? ClipRRect(
            child: Container(
              color: const Color.fromARGB(77, 238, 238, 238),
              width: MediaQuery.of(context).size.width,
              child: const DrawingBoard(),
            ),
          )
        : SingleChoiceTest(state: state);
  }
}
