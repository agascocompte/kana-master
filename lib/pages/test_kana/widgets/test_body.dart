import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/drawing_board.dart';
import 'package:kana_master/pages/test_kana/widgets/reveal_banner.dart';
import 'package:kana_master/pages/test_kana/widgets/single_choice_test.dart';
import 'package:kana_master/pages/test_kana/widgets/text_field_test.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class TestBody extends StatelessWidget {
  final TestKanaState state;
  final double kanaScale;

  const TestBody({
    super.key,
    required this.state,
    this.kanaScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final data = state.stateData;
    final session = data.session!;
    final item = data.current!;

    if (session.testType == TestType.drawingTest) {
      return Column(
        children: [
          if (data.revealed)
            RevealBanner(answer: item.symbol)
          else
            Text(
              session.kanaType == KanaType.kanji
                  ? t.app.testKanjiTraceHint
                  : t.app.testSketchHint,
              style: TextStyle(
                color: AppColors.slate,
                fontSize: 11,
              ),
            ),
          const SizedBox(height: 6),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final targetHeight =
                    (constraints.maxHeight * 0.98).clamp(220.0, 460.0);
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        child: DrawingBoard(
                          // A mistake reveals the correct character over the
                          // drawing.
                          showKanjiGuide: data.revealed ||
                              (!data.currentScriptUsesModel &&
                                  data.showKanjiTemplate),
                          guideOpacity: data.revealed ? 0.45 : 0.2,
                          kanjiGuideAssetPath: item.strokeAsset,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }

    if (session.difficulty == DifficultyLevel.low) {
      return SingleChoiceTest(state: state, kanaScale: kanaScale);
    }
    return TextFieldTest(state: state);
  }
}
