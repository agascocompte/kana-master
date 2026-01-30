import 'package:flutter/material.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/learn/widgets/kana_stroke_animation.dart';

class KanjiDialog extends StatelessWidget {
  final KanjiEntry entry;
  final List<String> meanings;

  const KanjiDialog({
    super.key,
    required this.entry,
    this.meanings = const [],
  });

  @override
  Widget build(BuildContext context) {
    final String meaningsText = meanings.join(', ');
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: KanaStrokeAnimation(
                    assetPath:
                        'assets/svg/kanji/${entry.unicode.toUpperCase()}.svg',
                  ),
                ),
                if (meaningsText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      meaningsText,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
