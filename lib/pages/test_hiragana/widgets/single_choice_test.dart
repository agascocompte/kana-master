import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/bloc/test_hiragana_bloc.dart';

class SingleChoiceTest extends StatefulWidget {
  final TestHiraganaState state;

  const SingleChoiceTest({super.key, required this.state});

  @override
  State<SingleChoiceTest> createState() => _SingleChoiceTestState();
}

class _SingleChoiceTestState extends State<SingleChoiceTest> {
  int? selectedAnswerIndex;
  Map<String, int> options = {};
  List<String> answers = [];

  @override
  void initState() {
    super.initState();
    if (widget.state.stateData.testType == TestType.singleChoiceTest) {
      generateAnswers();
    }
  }

  void generateAnswers() {
    final correctIndex =
        context.read<TestHiraganaBloc>().state.stateData.hiraganaIndex;

    final correctAnswer = hiraganasWithoutWo.values.elementAt(correctIndex);
    options = {correctAnswer: correctIndex};

    while (options.length < 4) {
      int randomIndex = Random().nextInt(hiraganasWithoutWo.length);
      String randomOption = hiraganasWithoutWo.values.elementAt(randomIndex);
      options[randomOption] = randomIndex;
    }

    answers = options.keys.toList();
    answers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TestHiraganaBloc, TestHiraganaState>(
      listener: (context, state) {
        if (state is NextHiraganaLoaded) {
          generateAnswers();
          selectedAnswerIndex = null;
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: answers.asMap().entries.map((entry) {
          int idx = entry.key;
          String answer = entry.value;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedAnswerIndex == idx ? jLightBLue : jOrange,
                ),
                onPressed: () {
                  if (!widget.state.stateData.canSubmitAnswer) {
                    context.read<TestHiraganaBloc>().add(EnableCheckAnswer());
                  }
                  context.read<TestHiraganaBloc>().add(
                      UpdateUserHiraganaIndexAnswer(
                          userIndex: options[answer] ?? 0));

                  setState(() {
                    selectedAnswerIndex = idx;
                  });
                },
                child: Text(
                  answer,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
