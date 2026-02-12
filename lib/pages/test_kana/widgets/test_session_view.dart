import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/test_body.dart';
import 'package:kana_master/pages/test_kana/widgets/test_buttons_row.dart';
import 'package:kana_master/pages/test_kana/widgets/test_title.dart';
import 'package:kana_master/theme/app_theme.dart';

class TestSessionView extends StatelessWidget {
  const TestSessionView({
    super.key,
    required this.state,
    required this.modeLabel,
    required this.kana,
    required this.kanaType,
    required this.kanjiEntries,
    required this.kanaScale,
    required this.kanjiMeanings,
    required this.difficultyLevel,
  });

  final TestKanaState state;
  final String modeLabel;
  final Map<String, String> kana;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;
  final double kanaScale;
  final Map<String, List<String>> kanjiMeanings;
  final DifficultyLevel difficultyLevel;

  @override
  Widget build(BuildContext context) {
    final keyboardInset = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + keyboardInset),
      child: Column(
        children: [
          Expanded(
            child: Container(
              key: ValueKey<int>(state.stateData.kanaIndex),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.sand),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(12),
                    blurRadius: 12,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TestTitle(
                    state: state,
                    kana: kana,
                    kanaType: kanaType,
                    kanjiEntries: kanjiEntries,
                    kanjiMeanings: kanjiMeanings,
                    kanaScale: kanaScale,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: TestBody(
                      state: state,
                      kana: kana,
                      kanaType: kanaType,
                      kanjiEntries: kanjiEntries,
                      kanjiMeanings: kanjiMeanings,
                      difficultyLevel: difficultyLevel,
                      kanaScale: kanaScale,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TestButtonsRow(
                      state: state,
                      kanaType: kanaType,
                      difficultyLevel: difficultyLevel,
                      kana: kana),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
