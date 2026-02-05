import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/pages/learn/bloc/learn_bloc.dart';
import 'package:kana_master/pages/learn/widgets/kana_dialog.dart';
import 'package:kana_master/pages/learn/widgets/kanji_dialog.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class LearnTab extends StatelessWidget {
  final List<KanaEntry> entries;
  final KanaType kanaType;

  const LearnTab({
    super.key,
    required this.entries,
    required this.kanaType,
  });

  @override
  Widget build(BuildContext context) {
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
          return _buildKanjiGrid(context, state.stateData);
        },
      );
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
                color: Colors.white,
                border: Border.all(color: AppColors.sand, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    key,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.ink,
                        ),
                  ),
                  Text(
                    entry.reading,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.slate,
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

  Widget _buildKanjiGrid(BuildContext context, LearnStateData data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: t.app.searchByMeaning,
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (value) =>
                      context.read<LearnBloc>().add(LearnQueryChanged(value)),
                ),
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: data.jlptFilter,
                onChanged: (value) {
                  if (value == null) return;
                  context
                      .read<LearnBloc>()
                      .add(LearnJlptFilterChanged(value));
                },
                items: [
                  DropdownMenuItem(value: 'all', child: Text(t.app.filterAll)),
                  const DropdownMenuItem(value: 'n5', child: Text('N5')),
                  const DropdownMenuItem(value: 'n4', child: Text('N4')),
                  const DropdownMenuItem(value: 'n3', child: Text('N3')),
                  const DropdownMenuItem(value: 'n2', child: Text('N2')),
                  const DropdownMenuItem(value: 'n1', child: Text('N1')),
                ],
              ),
            ],
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
            itemCount: data.filteredKanjiEntries.length,
            itemBuilder: (context, index) {
              final KanjiEntry entry = data.filteredKanjiEntries[index];
              final List<String> meanings =
                  data.kanjiMeanings[entry.unicode] ?? const [];
              final String meaning = meanings.isNotEmpty ? meanings.first : '';
              return GestureDetector(
                onTap: () => _showKanjiDialog(context, entry, meanings),
                child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.sand, width: 1),
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
                                color: AppColors.ink,
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
                                  color: AppColors.slate,
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
              kanaType == KanaType.hiragana ? "hiragana" : "katakana",
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
