import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';

class SwitchTileSetting extends StatelessWidget {
  final String title;
  final String optionText;
  final String subtitle;
  final bool value;
  final IconData icon;
  final void Function(bool) onChanged;

  const SwitchTileSetting({
    super.key,
    required this.title,
    required this.optionText,
    required this.subtitle,
    required this.value,
    required this.icon,
    required this.onChanged,
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
        SwitchListTile(
          title: Text(
            optionText,
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 12),
          ),
          value: value,
          onChanged: onChanged,
          activeTrackColor: jDarkBLue,
          inactiveThumbColor: Colors.black,
          secondary: Icon(icon, color: jDarkBLue),
        ),
      ],
    );
  }
}
