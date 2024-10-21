import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:hiragana_japanesse/pages/test_kana/widgets/drawing_board.dart';
import 'package:hiragana_japanesse/pages/test_kana/widgets/single_choice_test.dart';

class TestBody extends StatelessWidget {
  final TestKanaState state;
  final Map<String, String> kana;
  final DifficultyLevel difficultyLevel;

  const TestBody({
    super.key,
    required this.state,
    required this.kana,
    required this.difficultyLevel,
  });

  @override
  Widget build(BuildContext context) {
    return state.stateData.testType == TestType.drawingTest
        ? ClipRRect(
            child: Container(
              color: const Color.fromARGB(77, 238, 238, 238),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: const DrawingBoard(),
            ),
          )
        : difficultyLevel == DifficultyLevel.low
            ? SingleChoiceTest(
                state: state,
                kana: kana,
              )
            : Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Answer',
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                    onChanged: (value) => context
                        .read<TestKanaBloc>()
                        .add(UpdateUserTextAnswer(userAnswer: value)),
                  ),
                ),
              );
  }
}
