import 'package:flutter/material.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/theme/app_theme.dart';

class EmptyStatsCard extends StatelessWidget {
  const EmptyStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr.app.statsNoDataTitle,
            style: TextStyle(
              color: AppColors.ink,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            tr.app.statsNoDataSubtitle,
            style: const TextStyle(color: AppColors.slate),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
