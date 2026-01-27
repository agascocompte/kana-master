import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/learn/widgets/kana_dialog.dart';
import 'package:kana_master/pages/learn/widgets/kanji_dialog.dart';

class LearnTab extends StatelessWidget {
  final List<KanaEntry> entries;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;

  const LearnTab({
    super.key,
    required this.entries,
    required this.kanaType,
    this.kanjiEntries = const [],
  });

  @override
  Widget build(BuildContext context) {
    if (kanaType == KanaType.kanji) {
      return _buildKanjiGrid(context);
    }
    final List<String?> keys = kanaType == KanaType.hiragana
        ? hiraganaDisplayGrid
        : katakanaDisplayGrid;
    final Map<String, KanaEntry> entryByCharacter = {
      for (final entry in entries) entry.character: entry,
    };
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
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
          onTap: () => _showKanaDialog(context, entry),
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
                    entry.reading,
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

  Widget _buildKanjiGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: kanjiEntries.length,
      itemBuilder: (context, index) {
        final KanjiEntry entry = kanjiEntries[index];
        final String meaning =
            entry.meanings.isNotEmpty ? entry.meanings.first : '';
        return GestureDetector(
          onTap: () => _showKanjiDialog(context, entry),
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
                  Flexible(
                    child: Text(
                      entry.character,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                              ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      meaning,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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

  void _showKanaDialog(BuildContext context, KanaEntry entry) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KanaDialog(
          assetKey: entry.assetKey,
          displayText: entry.reading,
          kanaFolder: kanaType == KanaType.hiragana ? "hiragana" : "katakana",
        );
      },
    );
  }

  void _showKanjiDialog(BuildContext context, KanjiEntry entry) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KanjiDialog(entry: entry);
      },
    );
  }
}
