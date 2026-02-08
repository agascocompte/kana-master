import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/i18n/strings.g.dart';
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.sand),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.sand,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.bolt,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        modeLabel,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        t.app.testStayFocused,
                        style: const TextStyle(
                          color: AppColors.slate,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
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
          ),
        ],
      ),
    );
  }
}
