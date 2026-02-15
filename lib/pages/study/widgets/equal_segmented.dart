import 'package:flutter/material.dart';
import 'package:kana_master/domain/models/segment_option.dart';
import 'package:kana_master/theme/app_theme.dart';

class EqualSegmented<T> extends StatelessWidget {
  final T selected;
  final List<SegmentOption<T>> options;
  final ValueChanged<T> onSelected;

  const EqualSegmented({
    super.key,
    required this.selected,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: options.map((option) {
        final bool isSelected = option.value == selected;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () => onSelected(option.value),
              borderRadius: BorderRadius.circular(14),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                constraints: const BoxConstraints(minHeight: 70),
                decoration: BoxDecoration(
                  color: option.enabled
                      ? (isSelected ? AppColors.ink : AppColors.sand)
                      : AppColors.sand.withAlpha(150),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: option.enabled
                        ? (isSelected ? AppColors.ink : AppColors.sand)
                        : AppColors.slate.withAlpha(60),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (option.symbol != null)
                      Text(
                        option.symbol!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: option.enabled
                              ? (isSelected ? Colors.white : AppColors.graphite)
                              : AppColors.slate,
                        ),
                      ),
                    if (option.symbol != null) const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            option.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: option.enabled
                                  ? (isSelected
                                      ? Colors.white
                                      : AppColors.graphite)
                                  : AppColors.slate,
                            ),
                          ),
                        ),
                        if (!option.enabled) ...[
                          const SizedBox(width: 4),
                          Icon(
                            Icons.lock_outline,
                            size: 12,
                            color: AppColors.slate.withAlpha(180),
                          ),
                        ],
                      ],
                    ),
                    if (option.subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        option.subtitle!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: option.enabled
                              ? (isSelected ? Colors.white70 : AppColors.slate)
                              : AppColors.slate.withAlpha(180),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
