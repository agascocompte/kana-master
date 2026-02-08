import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

class KanjiTile extends StatelessWidget {
  const KanjiTile({
    super.key,
    required this.character,
    required this.meaning,
    required this.clampedScale,
    required this.kanaScale,
  });

  final String character;
  final double kanaScale;
  final double clampedScale;
  final String meaning;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headlineMedium;
    final titleSmall = Theme.of(context).textTheme.titleSmall;

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                height: (16 * clampedScale).clamp(12, 24).toDouble(),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    meaning,
                    textAlign: TextAlign.center,
                    style: titleSmall?.copyWith(
                      color: AppColors.slate,
                      fontSize: (titleSmall.fontSize ?? 12) * kanaScale,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
