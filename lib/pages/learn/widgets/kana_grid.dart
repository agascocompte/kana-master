import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/pages/learn/widgets/kana_tile.dart';

class KanaGrid extends StatelessWidget {
  const KanaGrid(
      {super.key,
      required this.entries,
      required this.kanaType,
      required this.tileAspectRatio,
      required this.clampedScale,
      required this.kanaScale,
      required this.onTapEntry});

  final List<KanaEntry> entries;
  final KanaType kanaType;
  final double tileAspectRatio;
  final double clampedScale;
  final double kanaScale;
  final ValueChanged<KanaEntry> onTapEntry;

  @override
  Widget build(BuildContext context) {
    final keys = kanaType == KanaType.hiragana
        ? hiraganaDisplayGrid
        : katakanaDisplayGrid;
    final entryByCharacter = {for (final e in entries) e.character: e};

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: tileAspectRatio,
      ),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        String? key = keys[index];
        if (key == null) {
          return const SizedBox.shrink();
        }
        final KanaEntry? entry = entryByCharacter[key];
        if (entry == null) {
          return const SizedBox.shrink();
        }
        return GestureDetector(
            onTap: () => onTapEntry(entry),
            child: KanaTile(
                character: key,
                reading: entry.reading,
                clampedScale: clampedScale,
                kanaScale: kanaScale));
      },
    );
  }
}
