import 'package:flutter/material.dart';

class HeroPrompt extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;
  final double scale;

  const HeroPrompt({
    super.key,
    required this.text,
    required this.background,
    required this.foreground,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: background.withAlpha(80),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: (44 * scale).clamp(32, 64).toDouble(),
                  color: foreground,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
      ),
    );
  }
}
