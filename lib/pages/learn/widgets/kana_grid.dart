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
    final keys = kanaType == KanaType.hiragana
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
                  key == null ? null : entryByCharacter[key];
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
        // Hiragana dakuten are already in the main grid; katakana ones aren't.
        if (isKatakana)
          ..._extraSection(
            context,
            title: tr.app.learnDakutenTitle,
            kana: katakanaDakuten,
            columns: 5,
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

  /// Characters without stroke data: tapping shows them large with their
  /// reading.
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
              onTap: () => _showKanaInfo(context, item.key, item.value),
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

  void _showKanaInfo(BuildContext context, String symbol, String reading) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: AppColors.surface,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              symbol,
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 8),
            Text(reading, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
