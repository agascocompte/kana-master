import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_groups.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/stats/widgets/section_card.dart';
import 'package:kana_master/theme/app_theme.dart';

enum _Mastery { mastered, learning, weak, unseen }

_Mastery _masteryOf(ItemStat? stat) {
  if (stat == null || stat.attempts == 0) return _Mastery.unseen;
  if (stat.mastered) return _Mastery.mastered;
  if (stat.weak) return _Mastery.weak;
  return _Mastery.learning;
}

Color _colorOf(_Mastery mastery) => switch (mastery) {
      _Mastery.mastered => AppColors.teal,
      _Mastery.learning => AppColors.peach,
      _Mastery.weak => AppColors.coral,
      _Mastery.unseen => AppColors.sand,
    };

/// Per-character progress: a grid of every kana coloured by mastery, or the
/// kanji that need review.
class MasterySection extends StatelessWidget {
  const MasterySection({
    super.key,
    required this.kanaType,
    required this.itemStats,
  });

  final KanaType kanaType;
  final Map<String, ItemStat> itemStats;

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    final bool isKanji = kanaType == KanaType.kanji;
    final List<String> symbols = isKanji
        ? itemStats.keys.toList()
        : [for (final g in kanaGroupsFor(kanaType)) ...g.symbols];
    final int mastered =
        symbols.where((s) => itemStats[s]?.mastered ?? false).length;

    return SectionCard(
      title: tr.app.statsMasteryTitle,
      subtitle: tr.app.statsMasterySubtitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr.app.statsMasteredCount(
                mastered: mastered, total: symbols.length),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 10),
          if (isKanji)
            _KanjiToReview(itemStats: itemStats)
          else
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                for (final symbol in symbols)
                  _Tile(
                    symbol: symbol,
                    mastery: _masteryOf(itemStats[symbol]),
                  ),
              ],
            ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 6,
            children: [
              _Legend(_Mastery.mastered, tr.app.statsLegendMastered),
              _Legend(_Mastery.learning, tr.app.statsLegendLearning),
              _Legend(_Mastery.weak, tr.app.statsLegendWeak),
              if (!isKanji) _Legend(_Mastery.unseen, tr.app.statsLegendNew),
            ],
          ),
        ],
      ),
    );
  }
}

class _KanjiToReview extends StatelessWidget {
  const _KanjiToReview({required this.itemStats});

  final Map<String, ItemStat> itemStats;

  @override
  Widget build(BuildContext context) {
    final weak = itemStats.entries.where((e) => e.value.weak).toList()
      ..sort((a, b) => b.value.incorrect.compareTo(a.value.incorrect));
    if (weak.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.app.statsWeakest,
          style: const TextStyle(color: AppColors.slate, fontSize: 12),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            for (final entry in weak.take(30))
              _Tile(symbol: entry.key, mastery: _Mastery.weak),
          ],
        ),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({required this.symbol, required this.mastery});

  final String symbol;
  final _Mastery mastery;

  @override
  Widget build(BuildContext context) {
    final color = _colorOf(mastery);
    final bool light = mastery == _Mastery.unseen;
    return Container(
      width: symbol.length > 1 ? 44 : 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: light ? color : color.withAlpha(60),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color),
      ),
      child: Text(
        symbol,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: light ? AppColors.slate : AppColors.ink,
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend(this.mastery, this.label);

  final _Mastery mastery;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: _colorOf(mastery),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.slate)),
      ],
    );
  }
}
