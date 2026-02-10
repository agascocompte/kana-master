import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/segment_option.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/study/widgets/action_card.dart';
import 'package:kana_master/pages/study/widgets/equal_segmented.dart';
import 'package:kana_master/pages/study/widgets/segmented_section_card.dart';
import 'package:kana_master/pages/study/widgets/stats_preview.dart';
import 'package:kana_master/router/router.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class StudyTab extends StatelessWidget {
  const StudyTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
        final KanaType kanaType = settingsState.stateData.kanaType;
        final DifficultyLevel difficulty =
            settingsState.stateData.difficultyLevel;
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr.app.studyHubTitle,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  tr.app.studyHubSubtitle,
                  style: const TextStyle(
                    color: AppColors.slate,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 18),
                SegmentedSectionCard(
                  title: tr.app.script,
                  child: EqualSegmented<KanaType>(
                    selected: kanaType,
                    onSelected: (value) {
                      context
                          .read<SettingsBloc>()
                          .add(SetKanaType(kanaType: value));
                    },
                    options: [
                      SegmentOption(
                        value: KanaType.hiragana,
                        title: tr.app.scriptHiragana,
                        symbol: 'あ',
                      ),
                      SegmentOption(
                        value: KanaType.katakana,
                        title: tr.app.scriptKatakana,
                        symbol: 'ア',
                      ),
                      SegmentOption(
                        value: KanaType.kanji,
                        title: tr.app.scriptKanji,
                        symbol: '漢',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SegmentedSectionCard(
                  title: tr.app.difficulty,
                  child: EqualSegmented<DifficultyLevel>(
                    selected: difficulty,
                    onSelected: (value) {
                      context.read<SettingsBloc>().add(
                            ChangeDifficultyLevel(difficultyLevel: value),
                          );
                    },
                    options: [
                      SegmentOption(
                        value: DifficultyLevel.low,
                        title: tr.app.difficultyEasy,
                        subtitle: tr.app.difficultyEasyDesc,
                      ),
                      SegmentOption(
                        value: DifficultyLevel.medium,
                        title: tr.app.difficultyMedium,
                        subtitle: tr.app.difficultyMediumDesc,
                      ),
                      SegmentOption(
                        value: DifficultyLevel.high,
                        title: tr.app.difficultyHard,
                        subtitle: tr.app.difficultyHardDesc,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  tr.app.paths,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 12),
                ActionCard(
                  title: tr.app.learn,
                  subtitle: tr.app.learnSubtitle,
                  icon: Icons.school_outlined,
                  gradient: const LinearGradient(
                    colors: [AppColors.peach, AppColors.coral],
                  ),
                  onTap: () => context.push(AppRouter.learnRoute),
                ),
                const SizedBox(height: 12),
                ActionCard(
                  title: tr.app.practice,
                  subtitle: tr.app.practiceSubtitle,
                  icon: Icons.flash_on_outlined,
                  gradient: const LinearGradient(
                    colors: [AppColors.teal, AppColors.sky],
                  ),
                  onTap: () => context.push(AppRouter.practiceRoute),
                ),
                const SizedBox(height: 12),
                ActionCard(
                  title: tr.app.materials,
                  subtitle: tr.app.materialsSubtitle,
                  icon: Icons.auto_stories_outlined,
                  gradient: const LinearGradient(
                    colors: [AppColors.lime, AppColors.teal],
                  ),
                  onTap: () => context.push(AppRouter.materialRoute),
                ),
                const SizedBox(height: 18),
                StatsPreview(kanaType: kanaType),
              ],
            ),
          ),
        );
      },
    );
  }
}
