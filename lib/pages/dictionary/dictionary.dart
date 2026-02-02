import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/pages/dictionary/bloc/dictionary_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

class DictionaryTab extends StatelessWidget {
  const DictionaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.mist, AppColors.sand],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dictionary',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Search words, kana, and meanings instantly.',
                style: TextStyle(color: AppColors.slate, fontSize: 14),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<DictionaryBloc, DictionaryState>(
                      builder: (context, state) {
                        return TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Search word, kana, romaji...',
                            prefixIcon: Icon(Icons.search),
                          ),
                          onChanged: (value) => context
                              .read<DictionaryBloc>()
                              .add(DictionaryQueryChanged(value)),
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                            context.read<DictionaryBloc>().add(
                                  SearchSubmitted(value),
                                );
                          },
                          textInputAction: TextInputAction.search,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  BlocBuilder<DictionaryBloc, DictionaryState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.read<DictionaryBloc>().add(
                                SearchSubmitted(state.stateData.currentQuery),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.ink,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(14),
                        ),
                        child: const Icon(Icons.arrow_forward),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<DictionaryBloc, DictionaryState>(
                  builder: (context, state) {
                    if (state is DictionaryLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.ink,
                        ),
                      );
                    }

                    if (state is DictionaryError &&
                        state.stateData.errorMessage.isNotEmpty) {
                      return Center(
                        child: Text(
                          state.stateData.errorMessage,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    if (state.stateData.entries.isEmpty) {
                      return const Center(
                        child: Text(
                          'Begin searching for a word.',
                          style: TextStyle(color: AppColors.graphite),
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: state.stateData.entries.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final entry = state.stateData.entries[index];
                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(12),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                entry.word,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.ink,
                                ),
                              ),
                              if (entry.reading.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: SelectableText(
                                    entry.reading,
                                    style:
                                        const TextStyle(color: AppColors.slate),
                                  ),
                                ),
                              const SizedBox(height: 8),
                              _ChipWrap(
                                items: entry.meanings,
                                color: AppColors.peach.withAlpha(70),
                                borderColor: AppColors.peach.withAlpha(120),
                              ),
                              if (entry.partsOfSpeech.isNotEmpty ||
                                  entry.tags.isNotEmpty ||
                                  entry.jlpt.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: _ChipWrap(
                                    items: [
                                      ...entry.partsOfSpeech,
                                      ...entry.tags,
                                      ...entry.jlpt,
                                    ],
                                    color: AppColors.mist,
                                    borderColor: AppColors.sand,
                                    textStyle:
                                        const TextStyle(fontSize: 12),
                                  ),
                                ),
                              if (entry.info.isNotEmpty ||
                                  entry.seeAlso.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (entry.info.isNotEmpty)
                                        _InfoBlock(
                                          title: 'Notes',
                                          lines: entry.info,
                                        ),
                                      if (entry.seeAlso.isNotEmpty)
                                        _InfoBlock(
                                          title: 'See also',
                                          lines: entry.seeAlso,
                                        ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChipWrap extends StatelessWidget {
  final List<String> items;
  final Color color;
  final Color borderColor;
  final TextStyle? textStyle;

  const _ChipWrap({
    required this.items,
    required this.color,
    required this.borderColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: items
          .map(
            (item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: borderColor, width: 1),
              ),
              child: SelectableText(
                item,
                style: textStyle ?? const TextStyle(fontSize: 13),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final List<String> lines;

  const _InfoBlock({
    required this.title,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 2),
        ...lines.map(
          (line) => Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: SelectableText(
              '• $line',
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
