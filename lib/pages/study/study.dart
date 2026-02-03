import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/home/bloc/home_nav_cubit.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/router/router.dart';
import 'package:kana_master/theme/app_theme.dart';

class StudyTab extends StatelessWidget {
  const StudyTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Study hub',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.push(AppRouter.settingsRoute),
                      icon: const Icon(Icons.tune),
                      color: AppColors.ink,
                      tooltip: 'Settings',
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Choose your script, then jump into learning or practice.',
                  style: TextStyle(
                    color: AppColors.slate,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 18),
                _SectionCard(
                  title: 'Script',
                  child: SegmentedButton<KanaType>(
                    segments: const [
                      ButtonSegment(
                        value: KanaType.hiragana,
                        label: Text('Hiragana'),
                        icon: Icon(Icons.bubble_chart_outlined),
                      ),
                      ButtonSegment(
                        value: KanaType.katakana,
                        label: Text('Katakana'),
                        icon: Icon(Icons.change_circle_outlined),
                      ),
                      ButtonSegment(
                        value: KanaType.kanji,
                        label: Text('Kanji'),
                        icon: Icon(Icons.grid_4x4_outlined),
                      ),
                    ],
                    selected: {kanaType},
                    onSelectionChanged: (value) {
                      context
                          .read<SettingsBloc>()
                          .add(SetKanaType(kanaType: value.first));
                    },
                  ),
                ),
                const SizedBox(height: 12),
                _SectionCard(
                  title: 'Difficulty',
                  child: SegmentedButton<DifficultyLevel>(
                    segments: const [
                      ButtonSegment(
                        value: DifficultyLevel.low,
                        label: Text('Easy'),
                        icon: Icon(Icons.filter_1),
                      ),
                      ButtonSegment(
                        value: DifficultyLevel.medium,
                        label: Text('Medium'),
                        icon: Icon(Icons.filter_2),
                      ),
                      ButtonSegment(
                        value: DifficultyLevel.high,
                        label: Text('Hard'),
                        icon: Icon(Icons.filter_3),
                      ),
                    ],
                    selected: {difficulty},
                    onSelectionChanged: (value) {
                      context.read<SettingsBloc>().add(
                          ChangeDifficultyLevel(difficultyLevel: value.first));
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Paths',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 12),
                _ActionCard(
                  title: 'Learn',
                  subtitle: 'Explore characters with stroke hints.',
                  icon: Icons.school_outlined,
                  gradient: const LinearGradient(
                    colors: [AppColors.peach, AppColors.coral],
                  ),
                  onTap: () => context.push(AppRouter.learnRoute),
                ),
                const SizedBox(height: 12),
                _ActionCard(
                  title: 'Practice',
                  subtitle: 'Test recognition, typing, and drawing.',
                  icon: Icons.flash_on_outlined,
                  gradient: const LinearGradient(
                    colors: [AppColors.teal, AppColors.sky],
                  ),
                  onTap: () => context.push(AppRouter.practiceRoute),
                ),
                const SizedBox(height: 12),
                _ActionCard(
                  title: 'Materials',
                  subtitle: 'Import your own CSV and drill it.',
                  icon: Icons.auto_stories_outlined,
                  gradient: const LinearGradient(
                    colors: [AppColors.lime, AppColors.teal],
                  ),
                  onTap: () => context.push(AppRouter.materialRoute),
                ),
                const SizedBox(height: 18),
                _StatsPreview(kanaType: kanaType),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.graphite,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(16),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(180),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.ink, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.graphite,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: AppColors.ink,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsPreview extends StatelessWidget {
  final KanaType kanaType;

  const _StatsPreview({required this.kanaType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state) {
        final summary = state.stateData.summaries[kanaType];
        if (summary == null || summary.total == 0) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.ink,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: const [
                Icon(Icons.insights, color: Colors.white),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Start a practice session to unlock your stats.',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ],
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.ink,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Momentum',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${summary.currentStreak} day streak',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${(summary.accuracy * 100).toStringAsFixed(0)}% accuracy',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () => context.read<HomeNavCubit>().selectTab(2),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.peach,
                ),
                child: const Text('View stats'),
              ),
            ],
          ),
        );
      },
    );
  }
}
