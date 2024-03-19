import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/learn_hiragana/widgets/hiragana_dialog.dart';

class LearnHiraganaTab extends StatelessWidget {
  const LearnHiraganaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: hiraganas.length,
      itemBuilder: (context, index) {
        String key = hiraganas.keys.elementAt(index);
        String value = hiraganas[key]!;
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
        return HiraganaDialog(romaji: romaji);
      },
    );
  }
}
