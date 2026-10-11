import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/learn/widgets/kana_stroke_animation.dart';
import 'package:kana_master/theme/app_theme.dart';

class KanaDialog extends StatelessWidget {
  /// One or more kana, e.g. "か", "ガ" or "きゃ".
  final String symbol;
  final String displayText;
  final KanaType kanaType;

  const KanaDialog({
    super.key,
    required this.symbol,
    required this.displayText,
    required this.kanaType,
  });

  @override
  Widget build(BuildContext context) {
    final String folder =
        kanaType == KanaType.katakana ? 'katakana' : 'hiragana';
    final List<String> assetPaths = [
      for (final rune in symbol.runes)
        'assets/svg/$folder/${rune.toRadixString(16).padLeft(5, '0')}.svg',
    ];
    return AlertDialog(
      elevation: 0,
      backgroundColor: AppColors.surface,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: KanaStrokeAnimation(assetPaths: assetPaths),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(displayText, style: const TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
