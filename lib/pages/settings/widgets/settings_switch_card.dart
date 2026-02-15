import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class SettingsSwitchCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onInfoPressed;

  const SettingsSwitchCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.onChanged,
    this.onInfoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        secondary: Icon(icon, color: AppColors.ink),
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                ),
              ),
            ),
            if (onInfoPressed != null)
              IconButton(
                icon: const Icon(
                  Icons.info_outline,
                  size: 18,
                  color: AppColors.slate,
                ),
                tooltip: 'Info',
                onPressed: onInfoPressed,
              ),
          ],
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.slate),
        ),
        activeThumbColor: AppColors.ink,
      ),
    );
  }
}
