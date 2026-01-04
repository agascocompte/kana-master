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
                    hintText: 'Buscar en Jisho (palabra, kana, romaji...)',
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
                      'Empieza buscando una palabra.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: state.stateData.entries.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final entry = state.stateData.entries[index];
                    return ListTile(
                      title: Text(
                        entry.word,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (entry.reading.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                entry.reading,
                                style: const TextStyle(color: jDarkBLue),
                              ),
                            ),
                          const SizedBox(height: 4),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: entry.meanings
                                .map(
                                  (meaning) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: jLightBLue.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                      border:
                                          Border.all(color: jLightBLue, width: 1),
                                    ),
                                    child: Text(
                                      meaning,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                )
                                .toList(),
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
