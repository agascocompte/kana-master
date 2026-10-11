import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/domain/models/kana_groups.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/learn/widgets/kana_tile.dart';
import 'package:kana_master/theme/app_theme.dart';

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
    final tr = context.t;
    final List<String?> keys = kanaType == KanaType.hiragana
        ? hiraganaDisplayGrid
        : katakanaDisplayGrid;
    final entryByCharacter = {for (final e in entries) e.character: e};
    final bool isKatakana = kanaType == KanaType.katakana;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: tileAspectRatio,
            ),
            itemCount: keys.length,
            itemBuilder: (context, index) {
              final String? key = keys[index];
              final KanaEntry? entry =
                  key == null ? null : _entryFor(key, entryByCharacter);
              if (key == null || entry == null) {
                return const SizedBox.shrink();
              }
              return GestureDetector(
                onTap: () => onTapEntry(entry),
                child: KanaTile(
                  character: key,
                  reading: entry.reading,
                  clampedScale: clampedScale,
                  kanaScale: kanaScale,
                ),
              );
            },
          ),
        ),
        ..._extraSection(
          context,
          title: tr.app.learnCombosTitle,
          kana: isKatakana ? katakanaCombos : hiraganaCombos,
          columns: 3,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }

  /// Katakana dakuten are not in [entries], which only has the base kana.
  KanaEntry? _entryFor(String key, Map<String, KanaEntry> entryByCharacter) {
    final KanaEntry? entry = entryByCharacter[key];
    if (entry != null) return entry;
    final String? reading = romajiForKana(key);
    return reading == null
        ? null
        : KanaEntry.fromCharacter(character: key, reading: reading);
  }

  List<Widget> _extraSection(
    BuildContext context, {
    required String title,
    required Map<String, String> kana,
    required int columns,
  }) {
    final items = kana.entries.toList();
    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 14, 12, 2),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(10),
        sliver: SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: tileAspectRatio * 5 / columns,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () => onTapEntry(KanaEntry.fromCharacter(
                  character: item.key, reading: item.value)),
              child: KanaTile(
                character: item.key,
                reading: item.value,
                clampedScale: clampedScale,
                kanaScale: kanaScale,
              ),
            );
          },
        ),
      ),
    ];
  }
}
