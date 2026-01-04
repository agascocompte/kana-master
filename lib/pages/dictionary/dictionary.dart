import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/dictionary/bloc/dictionary_bloc.dart';

class DictionaryTab extends StatefulWidget {
  const DictionaryTab({super.key});

  @override
  State<DictionaryTab> createState() => _DictionaryTabState();
}

class _DictionaryTabState extends State<DictionaryTab> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitSearch() {
    FocusScope.of(context).unfocus();
    context.read<DictionaryBloc>().add(SearchSubmitted(_controller.text));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Search word, kana, romaji...',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                  onSubmitted: (_) => _submitSearch(),
                  textInputAction: TextInputAction.search,
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _submitSearch,
                style: ElevatedButton.styleFrom(
                  backgroundColor: jOrange,
                  foregroundColor: Colors.black,
                ),
                child: const Icon(Icons.search),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: BlocBuilder<DictionaryBloc, DictionaryState>(
              builder: (context, state) {
                if (state is DictionaryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: jOrange),
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
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: state.stateData.entries.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final entry = state.stateData.entries[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(
                            entry.word,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (entry.reading.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: SelectableText(
                                entry.reading,
                                style: const TextStyle(color: jDarkBLue),
                              ),
                            ),
                          const SizedBox(height: 6),
                          _ChipWrap(
                            items: entry.meanings,
                            color: jOrange.withOpacity(0.14),
                            borderColor: jOrange.withOpacity(0.6),
                          ),
                          if (entry.partsOfSpeech.isNotEmpty ||
                              entry.tags.isNotEmpty ||
                              entry.jlpt.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: _ChipWrap(
                                items: [
                                  ...entry.partsOfSpeech,
                                  ...entry.tags,
                                  ...entry.jlpt,
                                ],
                                color: Colors.grey.shade200,
                                borderColor: Colors.grey.shade400,
                                textStyle: const TextStyle(fontSize: 12),
                              ),
                            ),
                          if (entry.info.isNotEmpty || entry.seeAlso.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
            color: jDarkBLue,
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
