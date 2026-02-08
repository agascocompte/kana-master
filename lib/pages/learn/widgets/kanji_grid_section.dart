import 'package:flutter/material.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/learn/bloc/learn_bloc.dart';
import 'package:kana_master/pages/learn/widgets/kanji_filters_bar.dart';
import 'package:kana_master/pages/learn/widgets/kanji_tile.dart';

class KanjiGridSection extends StatelessWidget {
  const KanjiGridSection({
    super.key,
    required this.kanaScale,
    required this.data,
    required this.tileAspectRatio,
    required this.clampedScale,
    required this.onQueryChanged,
    required this.onJlptChanged,
    required this.onTapEntry,
  });

  final LearnStateData data;
  final double tileAspectRatio;
  final double clampedScale;
  final double kanaScale;

  final ValueChanged<String> onQueryChanged;
  final ValueChanged<String> onJlptChanged;
  final void Function(KanjiEntry entry, List<String> meanings) onTapEntry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KanjiFiltersBar(
          jlptFilter: data.jlptFilter,
          onQueryChanged: onQueryChanged,
          onJlptChanged: onJlptChanged,
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: tileAspectRatio,
            ),
            itemCount: data.filteredKanjiEntries.length,
            itemBuilder: (context, index) {
              final KanjiEntry entry = data.filteredKanjiEntries[index];
              final List<String> meanings =
                  data.kanjiMeanings[entry.unicode] ?? const [];
              final String meaning = meanings.isNotEmpty ? meanings.first : '';
              return GestureDetector(
                onTap: () => onTapEntry(entry, meanings),
                child: KanjiTile(
                    character: entry.character,
                    kanaScale: kanaScale,
                    meaning: meaning,
                    clampedScale: clampedScale),
              );
            },
          ),
        ),
      ],
    );
  }
}
