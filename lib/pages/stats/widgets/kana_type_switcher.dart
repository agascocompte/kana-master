import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/stats_summary.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/theme/app_theme.dart';

class KanaTypeSwitcher extends StatelessWidget {
  final KanaType selectedType;
  final ValueChanged<KanaType> onSelected;
  final Map<KanaType, StatsSummary> summaries;

  const KanaTypeSwitcher({
    super.key,
    required this.selectedType,
    required this.onSelected,
    required this.summaries,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: KanaType.values.map((type) {
        final StatsSummary summary = summaries[type] ??
            StatsSummary(
              correct: 0,
              incorrect: 0,
              total: 0,
              accuracy: 0,
              currentStreak: 0,
              bestStreak: 0,
              last7DaysCount: 0,
              last30DaysCount: 0,
              lastActiveDate: null,
            );
        final bool isSelected = type == selectedType;
        final Color accent = _accentForType(type);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => onSelected(type),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? accent.withAlpha(60) : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? accent : AppColors.sand,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(10),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _labelForType(type),
                      style: TextStyle(
                        color: AppColors.ink,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${(summary.accuracy * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '${summary.total} ${t.app.statsAttempts}',
                      style: TextStyle(
                        color: AppColors.slate,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _labelForType(KanaType type) {
    switch (type) {
      case KanaType.hiragana:
        return t.app.scriptHiragana;
      case KanaType.katakana:
        return t.app.scriptKatakana;
      case KanaType.kanji:
        return t.app.scriptKanji;
    }
  }

  Color _accentForType(KanaType type) {
    switch (type) {
      case KanaType.hiragana:
        return AppColors.peach;
      case KanaType.katakana:
        return AppColors.teal;
      case KanaType.kanji:
        return AppColors.sky;
    }
  }
}
