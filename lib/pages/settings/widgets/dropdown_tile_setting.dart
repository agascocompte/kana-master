import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class DropdownTileSetting<T> extends StatelessWidget {
  final String title;
  final String subtitle;
  final T currentValue;
  final IconData icon;
  final void Function(T?) onChanged;
  final List<DropdownMenuItem<T>>? items;

  const DropdownTileSetting({
    super.key,
    required this.title,
    required this.subtitle,
    required this.currentValue,
    required this.icon,
    required this.onChanged,
    required this.items,
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
      child: ListTile(
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
        trailing: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: currentValue,
            icon: const Icon(Icons.expand_more),
            onChanged: onChanged,
            items: items,
          ),
        ),
      ),
    );
  }
}
