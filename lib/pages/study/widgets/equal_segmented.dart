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
                  color: isSelected ? AppColors.ink : AppColors.sand,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? AppColors.ink : AppColors.sand,
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
                          color: isSelected ? Colors.white : AppColors.graphite,
                        ),
                      ),
                    if (option.symbol != null) const SizedBox(height: 6),
                    Text(
                      option.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: isSelected ? Colors.white : AppColors.graphite,
                      ),
                    ),
                    if (option.subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        option.subtitle!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: isSelected ? Colors.white70 : AppColors.slate,
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
