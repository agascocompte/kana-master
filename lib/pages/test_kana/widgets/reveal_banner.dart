import 'package:flutter/material.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/theme/app_theme.dart';

/// Shown after a mistake with the correct answer.
class RevealBanner extends StatelessWidget {
  const RevealBanner({super.key, required this.answer});

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.coral.withAlpha(40),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.coral),
      ),
      child: Row(
        children: [
          Icon(Icons.close_rounded, color: AppColors.coral),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              context.t.app.testCorrectAnswerWas(answer: answer),
              style: TextStyle(
                color: AppColors.ink,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
