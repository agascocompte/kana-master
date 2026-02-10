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
                const Icon(Icons.insights, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    tr.app.statsStartToUnlock,
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
                    tr.app.statsMomentum,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tr.app.statsStreakDays(days: summary.currentStreak),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${tr.app.statsAccuracy} ${(summary.accuracy * 100).toStringAsFixed(0)}%',
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
                child: Text(tr.app.statsView),
              ),
            ],
          ),
        );
      },
    );
  }
}
