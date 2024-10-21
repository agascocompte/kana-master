import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/extensions.dart';

class DropdownTileSetting extends StatelessWidget {
  final String title;
  final String subtitle;
  final DifficultyLevel currentValue;
  final IconData icon;
  final void Function(DifficultyLevel?) onChanged;
  final List<DropdownMenuItem<DifficultyLevel>>? items;

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
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: jDarkBLue,
          ),
        ),
        Divider(
          color: jLightBLue,
        ),
        ListTile(
          leading: Icon(icon, color: jDarkBLue),
          title: Text(
            "Difficulty: ${currentValue.toString().split('.').last.capitalize()}",
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 12),
          ),
          trailing: DropdownButton<DifficultyLevel>(
            value: currentValue,
            icon: const Icon(Icons.arrow_downward),
            onChanged: onChanged,
            items: items,
          ),
        ),
      ],
    );
  }
}
