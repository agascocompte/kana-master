import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/home/bloc/home_nav_cubit.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/router/router.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

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
                Text(
                  t.app.studyHubTitle,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  t.app.studyHubSubtitle,
                  style: const TextStyle(
                    color: AppColors.slate,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 18),
                _SectionCard(
                  title: t.app.script,
                  child: _EqualSegmented<KanaType>(
                    selected: kanaType,
                    onSelected: (value) {
                      context
                          .read<SettingsBloc>()
                          .add(SetKanaType(kanaType: value));
                    },
                    options: const [
                      _SegmentOption(
                        value: KanaType.hiragana,
                        title: 'Hiragana',
                        symbol: 'あ',
                      ),
                      _SegmentOption(
                        value: KanaType.katakana,
                        title: 'Katakana',
                        symbol: 'ア',
                      ),
                      _SegmentOption(
                        value: KanaType.kanji,
                        title: 'Kanji',
                        symbol: '漢',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _SectionCard(
                  title: t.app.difficulty,
                  child: _EqualSegmented<DifficultyLevel>(
                    selected: difficulty,
                    onSelected: (value) {
                      context.read<SettingsBloc>().add(
                            ChangeDifficultyLevel(difficultyLevel: value),
                          );
                    },
                    options: [
                      _SegmentOption(
                        value: DifficultyLevel.low,
                        title: t.app.difficultyEasy,
                        subtitle: t.app.difficultyEasyDesc,
                      ),
                      _SegmentOption(
                        value: DifficultyLevel.medium,
                        title: t.app.difficultyMedium,
                        subtitle: t.app.difficultyMediumDesc,
                      ),
                      _SegmentOption(
                        value: DifficultyLevel.high,
                        title: t.app.difficultyHard,
                        subtitle: t.app.difficultyHardDesc,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  t.app.paths,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 12),
                _ActionCard(
                  title: t.app.learn,
                  subtitle: t.app.learnSubtitle,
                  icon: Icons.school_outlined,
                  gradient: const LinearGradient(
                    colors: [AppColors.peach, AppColors.coral],
                  ),
                  onTap: () => context.push(AppRouter.learnRoute),
                ),
                const SizedBox(height: 12),
                _ActionCard(
                  title: t.app.practice,
                  subtitle: t.app.practiceSubtitle,
                  icon: Icons.flash_on_outlined,
                  gradient: const LinearGradient(
                    colors: [AppColors.teal, AppColors.sky],
                  ),
                  onTap: () => context.push(AppRouter.practiceRoute),
                ),
                const SizedBox(height: 12),
                _ActionCard(
                  title: t.app.materials,
                  subtitle: t.app.materialsSubtitle,
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
      width: double.infinity,
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
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
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
      ),
    );
  }
}

class _SegmentOption<T> {
  final T value;
  final String title;
  final String? subtitle;
  final String? symbol;

  const _SegmentOption({
    required this.value,
    required this.title,
    this.subtitle,
    this.symbol,
  });
}

class _EqualSegmented<T> extends StatelessWidget {
  final T selected;
  final List<_SegmentOption<T>> options;
  final ValueChanged<T> onSelected;

  const _EqualSegmented({
    required this.selected,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: options.map((option) {
        final bool isSelected = option.value == selected;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () => onSelected(option.value),
              borderRadius: BorderRadius.circular(14),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                constraints: const BoxConstraints(minHeight: 70),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.ink : AppColors.sand,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? AppColors.ink : AppColors.sand,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (option.symbol != null)
                      Text(
                        option.symbol!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? Colors.white : AppColors.graphite,
                        ),
                      ),
                    if (option.symbol != null) const SizedBox(height: 6),
                    Text(
                      option.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: isSelected ? Colors.white : AppColors.graphite,
                      ),
                    ),
                    if (option.subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        option.subtitle!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: isSelected ? Colors.white70 : AppColors.slate,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
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
              children: [
                const Icon(Icons.insights, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    t.app.statsStartToUnlock,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
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
                  Text(
                    t.app.statsMomentum,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    t.app.statsStreakDays(days: summary.currentStreak),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${t.app.statsAccuracy} ${(summary.accuracy * 100).toStringAsFixed(0)}%',
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
                child: Text(t.app.statsView),
              ),
            ],
          ),
        );
      },
    );
  }
}
