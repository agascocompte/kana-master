import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const SectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.ink,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.slate,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
