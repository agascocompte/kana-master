import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

class SingleChoiceTest extends StatefulWidget {
  final TestKanaState state;
  final Map<String, String> kana;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;
  final Map<String, List<String>> kanjiMeanings;

  const SingleChoiceTest({
    super.key,
    required this.state,
    required this.kana,
    required this.kanaType,
    this.kanjiEntries = const [],
    this.kanjiMeanings = const {},
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
    if (widget.kanaType == KanaType.kanji) {
      final String correctAnswer =
          _kanjiAnswerForIndex(correctIndex, widget.kanjiEntries);
      options = {correctAnswer: correctIndex};
      while (options.length < 4 && widget.kanjiEntries.length >= 4) {
        int randomIndex = Random().nextInt(widget.kanjiEntries.length);
        String randomOption =
            _kanjiAnswerForIndex(randomIndex, widget.kanjiEntries);
        options[randomOption] = randomIndex;
      }
    } else {
      final correctAnswer = widget.kana.values.elementAt(correctIndex);
      options = {correctAnswer: correctIndex};

      while (options.length < 4) {
        int randomIndex = Random().nextInt(widget.kana.length);
        String randomOption = widget.kana.values.elementAt(randomIndex);
        options[randomOption] = randomIndex;
      }
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
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: selectedAnswerIndex == idx
                      ? AppColors.ink
                      : Colors.white,
                  foregroundColor: selectedAnswerIndex == idx
                      ? Colors.white
                      : AppColors.ink,
                  side: BorderSide(
                    color: selectedAnswerIndex == idx
                        ? AppColors.ink
                        : AppColors.sand,
                    width: 1,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.kanaType == KanaType.kanji ? 16 : 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _kanjiAnswerForIndex(int index, List<KanjiEntry> entries) {
    if (index < 0 || index >= entries.length) return '';
    final String key = entries[index].unicode;
    final List<String> meanings = widget.kanjiMeanings[key] ?? const [];
    return meanings.isNotEmpty ? meanings.first : '';
  }
}
