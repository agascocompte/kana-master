import 'package:flutter/material.dart';

class ChipWrap extends StatelessWidget {
  final List<String> items;
  final Color color;
  final Color borderColor;
  final TextStyle? textStyle;

  const ChipWrap({
    super.key,
    required this.items,
    required this.color,
    required this.borderColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: items
          .map(
            (item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor, width: 1),
              ),
              child: SelectableText(
                item,
                style: textStyle ?? const TextStyle(fontSize: 13),
              ),
            ),
          )
          .toList(),
    );
  }
}
