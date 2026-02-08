import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class KanaTile extends StatelessWidget {
  const KanaTile(
      {super.key,
      required this.character,
      required this.reading,
      required this.clampedScale,
      required this.kanaScale});

  final String character;
  final String reading;
  final double clampedScale;
  final double kanaScale;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headlineMedium;
    final title = Theme.of(context).textTheme.titleMedium;

    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.sand, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: (36 * clampedScale).clamp(28, 52).toDouble(),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  character,
                  style: headline?.copyWith(
                    color: AppColors.ink,
                    fontSize: (headline.fontSize ?? 32) * kanaScale,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: (18 * clampedScale).clamp(12, 28).toDouble(),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  reading,
                  style: title?.copyWith(
                    color: AppColors.slate,
                    fontSize: (title.fontSize ?? 16) * kanaScale,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
