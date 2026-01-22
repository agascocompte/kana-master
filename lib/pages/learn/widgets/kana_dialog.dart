import 'package:flutter/material.dart';
import 'package:kana_master/pages/learn/widgets/kana_stroke_animation.dart';

class KanaDialog extends StatelessWidget {
  final String romaji;
  final String kanaFolder;

  const KanaDialog({
    super.key,
    required this.romaji,
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
              assetPath: 'assets/svg/$kanaFolder/$romaji.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(romaji, style: const TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
