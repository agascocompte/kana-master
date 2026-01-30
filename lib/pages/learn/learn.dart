import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/learn/widgets/kana_dialog.dart';
import 'package:kana_master/pages/learn/widgets/kanji_dialog.dart';

class LearnTab extends StatefulWidget {
  final List<KanaEntry> entries;
  final KanaType kanaType;
  final List<KanjiEntry> kanjiEntries;
  final Map<String, List<String>> kanjiMeanings;

  const LearnTab({
    super.key,
    required this.entries,
    required this.kanaType,
    this.kanjiEntries = const [],
    this.kanjiMeanings = const {},
  });

  @override
  State<LearnTab> createState() => _LearnTabState();
}

class _LearnTabState extends State<LearnTab> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    if (widget.kanaType == KanaType.kanji) {
      return _buildKanjiGrid(context);
    }
    final List<String?> keys = widget.kanaType == KanaType.hiragana
        ? hiraganaDisplayGrid
        : katakanaDisplayGrid;
    final Map<String, KanaEntry> entryByCharacter = {
      for (final entry in widget.entries) entry.character: entry,
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
    final String query = _query.trim().toLowerCase();
    final List<KanjiEntry> filteredEntries = query.isEmpty
        ? widget.kanjiEntries
        : widget.kanjiEntries.where((entry) {
            final List<String> meanings =
                widget.kanjiMeanings[entry.unicode] ?? const [];
            return meanings
                .any((meaning) => meaning.toLowerCase().contains(query));
          }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search by meaning',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) => setState(() {
              _query = value;
            }),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: filteredEntries.length,
            itemBuilder: (context, index) {
              final KanjiEntry entry = filteredEntries[index];
              final List<String> meanings =
                  widget.kanjiMeanings[entry.unicode] ?? const [];
              final String meaning = meanings.isNotEmpty ? meanings.first : '';
              return GestureDetector(
                onTap: () => _showKanjiDialog(context, entry, meanings),
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
                          entry.character,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            meaning,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
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
          ),
        ),
      ],
    );
  }

  void _showKanaDialog(BuildContext context, KanaEntry entry) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KanaDialog(
          assetKey: entry.assetKey,
          displayText: entry.reading,
          kanaFolder:
              widget.kanaType == KanaType.hiragana ? "hiragana" : "katakana",
        );
      },
    );
  }

  void _showKanjiDialog(
    BuildContext context,
    KanjiEntry entry,
    List<String> meanings,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KanjiDialog(entry: entry, meanings: meanings);
      },
    );
  }
}
