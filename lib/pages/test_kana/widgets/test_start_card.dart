import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

class TestStartCard extends StatelessWidget {
  const TestStartCard({
    super.key,
    required this.modeLabel,
    required this.kana,
    required this.kanaType,
    required this.kanjiEntries,
    required this.kanjiMeanings,
    required this.difficultyLevel,
    required this.useModelHiragana,
    required this.useModelKatakana,
    required this.useModelKanji,
  });

  final String modeLabel;
  final Map<String, String> kana;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;
  final Map<String, List<String>> kanjiMeanings;
  final DifficultyLevel difficultyLevel;
  final bool useModelHiragana;
  final bool useModelKatakana;
  final bool useModelKanji;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(20),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.flash_on_outlined,
              size: 36,
              color: AppColors.ink,
            ),
            const SizedBox(height: 12),
            Text(
              modeLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              t.app.practiceStartSubtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.slate,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => context.read<TestKanaBloc>().add(
                    BeginTest(
                      kana: kana,
                      kanaType: kanaType,
                      kanjiEntries: kanjiEntries,
                      kanjiMeanings: kanjiMeanings,
                      difficultyLevel: difficultyLevel,
                      useModelHiragana: useModelHiragana,
                      useModelKatakana: useModelKatakana,
                      useModelKanji: useModelKanji,
                    ),
                  ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.ink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              icon: const Icon(Icons.play_arrow),
              label: Text(t.app.beginSession),
            ),
          ],
        ),
      ),
    );
  }
}
