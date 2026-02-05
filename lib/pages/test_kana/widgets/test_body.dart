import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/drawing_board.dart';
import 'package:kana_master/pages/test_kana/widgets/single_choice_test.dart';
import 'package:kana_master/pages/test_kana/widgets/text_field_test.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class TestBody extends StatelessWidget {
  final TestKanaState state;
  final Map<String, String> kana;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;
  final Map<String, List<String>> kanjiMeanings;
  final DifficultyLevel difficultyLevel;

  const TestBody({
    super.key,
    required this.state,
    required this.kana,
    required this.kanaType,
    this.kanjiEntries = const [],
    this.kanjiMeanings = const {},
    required this.difficultyLevel,
  });

  @override
  Widget build(BuildContext context) {
    return state.stateData.testType == TestType.drawingTest
        ? Column(
            children: [
              Text(
                t.app.testSketchHint,
                style: const TextStyle(
                  color: AppColors.slate,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.mist,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.sand, width: 2),
                      ),
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        child: DrawingBoard(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : difficultyLevel == DifficultyLevel.low
            ? SingleChoiceTest(
                state: state,
                kana: kana,
                kanaType: kanaType,
                kanjiEntries: kanjiEntries,
                kanjiMeanings: kanjiMeanings,
              )
            : TextFieldTest(kanaType: kanaType);
  }
}
