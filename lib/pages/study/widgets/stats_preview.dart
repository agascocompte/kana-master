import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/home/bloc/home_nav_cubit.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

class StatsPreview extends StatelessWidget {
  final KanaType kanaType;

  const StatsPreview({super.key, required this.kanaType});

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
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
                Icon(Icons.insights, color: AppColors.onInk),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    tr.app.statsStartToUnlock,
                    style: TextStyle(color: AppColors.onInk, fontSize: 13),
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
                    tr.app.statsMomentum,
                    style: TextStyle(
                      color: AppColors.onInk.withAlpha(180),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tr.app.statsStreakDays(days: summary.currentStreak),
                    style: TextStyle(
                      color: AppColors.onInk,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${tr.app.statsAccuracy} ${(summary.accuracy * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: AppColors.onInk.withAlpha(180),
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
                child: Text(tr.app.statsView),
              ),
            ],
          ),
        );
      },
    );
  }
}
