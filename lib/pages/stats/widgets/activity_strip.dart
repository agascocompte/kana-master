import 'package:flutter/material.dart';
import 'package:kana_master/domain/models/activity_day.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/theme/app_theme.dart';

class ActivityStrip extends StatelessWidget {
  final List<ActivityDay> days;

  const ActivityStrip({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    if (days.isEmpty) {
      return Text(
        t.app.statsNoActivity,
        style: const TextStyle(color: AppColors.slate),
      );
    }
    final int maxCount =
        days.map((day) => day.count).fold(0, (a, b) => a > b ? a : b);
    return Row(
      children: days.map((day) {
        final double heightFactor =
            maxCount == 0 ? 0.1 : (day.count / maxCount).clamp(0.1, 1.0);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              children: [
                Container(
                  height: 64 * heightFactor,
                  decoration: BoxDecoration(
                    color: day.count > 0 ? AppColors.teal : AppColors.sand,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  day.label,
                  style: const TextStyle(
                    color: AppColors.slate,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
