import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class SettingsActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      // Ink splashes need a Material above the decorated box.
      child: Material(
        type: MaterialType.transparency,
        child: ListTile(
          onTap: onTap,
          leading: Icon(icon, color: AppColors.ink),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: AppColors.slate),
          ),
          trailing: Icon(Icons.chevron_right, color: AppColors.slate),
        ),
      ),
    );
  }
}
