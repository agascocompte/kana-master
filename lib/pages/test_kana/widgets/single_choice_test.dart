import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';

class SingleChoiceTest extends StatefulWidget {
  final TestKanaState state;
  final Map<String, String> kana;

  const SingleChoiceTest({
    super.key,
    required this.state,
    required this.kana,
  });

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
    if (widget.state.stateData.testType == TestType.singleAnswer) {
      generateAnswers();
    }
  }

  void generateAnswers() {
    final correctIndex = context.read<TestKanaBloc>().state.stateData.kanaIndex;

    final correctAnswer = widget.kana.values.elementAt(correctIndex);
    options = {correctAnswer: correctIndex};

    while (options.length < 4) {
      int randomIndex = Random().nextInt(widget.kana.length);
      String randomOption = widget.kana.values.elementAt(randomIndex);
      options[randomOption] = randomIndex;
    }

    answers = options.keys.toList();
    answers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TestKanaBloc, TestKanaState>(
      listener: (context, state) {
        if (state is NextKanaLoaded) {
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
                    context.read<TestKanaBloc>().add(EnableCheckAnswer());
                  }
                  context.read<TestKanaBloc>().add(UpdateUserKanaIndexAnswer(
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
