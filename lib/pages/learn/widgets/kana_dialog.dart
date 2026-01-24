import 'package:flutter/material.dart';
import 'package:kana_master/pages/learn/widgets/kana_stroke_animation.dart';

class KanaDialog extends StatelessWidget {
  final String assetKey;
  final String displayText;
  final String kanaFolder;

  const KanaDialog({
    super.key,
    required this.assetKey,
    required this.displayText,
    required this.kanaFolder,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: KanaStrokeAnimation(
              assetPath: 'assets/svg/$kanaFolder/$assetKey.svg',
            ),
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
