import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class InfoBlock extends StatelessWidget {
  final String title;
  final List<String> lines;

  const InfoBlock({
    super.key,
    required this.title,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 2),
        ...lines.map(
          (line) => Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: SelectableText(
              '• $line',
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
