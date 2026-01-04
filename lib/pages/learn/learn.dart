import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/learn/widgets/kana_dialog.dart';

class LearnTab extends StatelessWidget {
  final Map<String, String> kana;

  const LearnTab({
    super.key,
    required this.kana,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: kana.length,
      itemBuilder: (context, index) {
        String key = kana.keys.elementAt(index);
        String value = kana[key]!;
        return GestureDetector(
          onTap: () => _showGifDialog(context, value),
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: jLightBLue,
                border: Border.all(color: jDarkBLue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    key,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showGifDialog(BuildContext context, String romaji) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KanaDialog(
          romaji: romaji,
          kanaFolder: kana == hiragana ? "hiragana" : "katakana",
        );
      },
    );
  }
}
