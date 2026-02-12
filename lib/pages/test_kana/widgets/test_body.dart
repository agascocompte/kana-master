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
  final double kanaScale;

  const TestBody({
    super.key,
    required this.state,
    required this.kana,
    required this.kanaType,
    this.kanjiEntries = const [],
    this.kanjiMeanings = const {},
    required this.difficultyLevel,
    this.kanaScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return state.stateData.testType == TestType.drawingTest
        ? Column(
            children: [
              Text(
                kanaType == KanaType.kanji
                    ? t.app.testKanjiTraceHint
                    : t.app.testSketchHint,
                style: const TextStyle(
                  color: AppColors.slate,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final targetHeight =
                        (constraints.maxHeight * 0.98).clamp(280.0, 460.0);
                    return Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: double.infinity,
                        height: targetHeight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.mist,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: AppColors.sand, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(18),
                            ),
                            child: DrawingBoard(
                              showKanjiGuide:
                                  !state.stateData.currentScriptUsesModel &&
                                      state.stateData.showKanjiTemplate,
                              kanjiGuideAssetPath: _guideAssetPath(
                                kanaType: kanaType,
                                kanaIndex: state.stateData.kanaIndex,
                                kanjiEntries: kanjiEntries,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                kanaScale: kanaScale,
              )
            : TextFieldTest(
                kanaType: kanaType,
                kanaIndex: state.stateData.kanaIndex,
              );
  }
}

String? _guideAssetPath({
  required KanaType kanaType,
  required int kanaIndex,
  required List<KanjiEntry> kanjiEntries,
}) {
  if (kanaType == KanaType.kanji) {
    if (kanaIndex < 0 || kanaIndex >= kanjiEntries.length) return null;
    final unicode =
        kanjiEntries[kanaIndex].unicode.toUpperCase().padLeft(5, '0');
    return 'assets/svg/kanji/$unicode.svg';
  }

  final String? symbol = kanaType == KanaType.katakana
      ? (kanaIndex >= 0 && kanaIndex < katakanaModelLabels.length
          ? katakanaModelLabels[kanaIndex]
          : null)
      : (kanaIndex >= 0 && kanaIndex < hiragana.keys.length
          ? hiragana.keys.elementAt(kanaIndex)
          : null);
  if (symbol == null) return null;
  final code = symbol.runes.first.toRadixString(16).padLeft(5, '0');
  if (kanaType == KanaType.katakana) {
    return 'assets/svg/katakana/$code.svg';
  }
  return 'assets/svg/hiragana/$code.svg';
}
