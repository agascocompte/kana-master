import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/learn/bloc/learn_bloc.dart';
import 'package:kana_master/pages/learn/widgets/kana_dialog.dart';
import 'package:kana_master/pages/learn/widgets/kana_grid.dart';
import 'package:kana_master/pages/learn/widgets/kanji_dialog.dart';
import 'package:kana_master/pages/learn/widgets/kanji_grid_section.dart';

class LearnTab extends StatelessWidget {
  final List<KanaEntry> entries;
  final KanaType kanaType;
  final double kanaScale;

  const LearnTab({
    super.key,
    required this.entries,
    required this.kanaType,
    this.kanaScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final double clampedScale = kanaScale.clamp(0.8, 1.4);
    final double tileAspectRatio = 1.0 / clampedScale;
    if (kanaType == KanaType.kanji) {
      return BlocBuilder<LearnBloc, LearnState>(
        builder: (context, state) {
          if (state is LearnLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LearnError) {
            return Center(
              child: Text(state.stateData.errorMessage),
            );
          }

          final data = state.stateData;
          return KanjiGridSection(
              data: data,
              kanaScale: kanaScale,
              tileAspectRatio: tileAspectRatio,
              clampedScale: clampedScale,
              onQueryChanged: (q) =>
                  context.read<LearnBloc>().add(LearnQueryChanged(q)),
              onJlptChanged: (jlpt) =>
                  context.read<LearnBloc>().add(LearnJlptFilterChanged(jlpt)),
              onTapEntry: (entry, meanings) =>
                  _showKanjiDialog(context, entry, meanings));
        },
      );
    }

    return KanaGrid(
        entries: entries,
        kanaType: kanaType,
        tileAspectRatio: tileAspectRatio,
        clampedScale: clampedScale,
        kanaScale: kanaScale,
        onTapEntry: (entry) => _showKanaDialog(context, entry));
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
