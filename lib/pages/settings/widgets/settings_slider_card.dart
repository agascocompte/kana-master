import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class SettingsSliderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String label;
  final IconData icon;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  const SettingsSliderCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.label,
    required this.icon,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, color: AppColors.ink),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: AppColors.slate),
            ),
            trailing: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
          ),
          Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
            activeColor: AppColors.ink,
            inactiveColor: AppColors.sand,
          ),
        ],
      ),
    );
  }
}
