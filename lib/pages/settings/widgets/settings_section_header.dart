import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class SettingsSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onInfoPressed;

  const SettingsSectionHeader({
    super.key,
    required this.title,
    this.onInfoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: AppColors.graphite,
              letterSpacing: 0.3,
            ),
          ),
        ),
        if (onInfoPressed != null)
          IconButton(
            tooltip: 'Info',
            icon: const Icon(
              Icons.info_outline,
              size: 18,
              color: AppColors.slate,
            ),
            onPressed: onInfoPressed,
          ),
      ],
    );
  }
}
