import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/domain/models/dictionary_entry.dart';
import 'package:kana_master/pages/dictionary/bloc/dictionary_bloc.dart';
import 'package:kana_master/pages/dictionary/widgets/dictionary_entry_card.dart';
import 'package:kana_master/pages/dictionary/widgets/search_action_bar.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class DictionaryTab extends StatelessWidget {
  const DictionaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
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
              Text(
                tr.app.dictionary,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                tr.app.dictionarySubtitle,
                style: const TextStyle(color: AppColors.slate, fontSize: 14),
              ),
              const SizedBox(height: 16),
              SearchActionBar(),
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
                      return Center(
                        child: Text(
                          tr.app.dictionaryEmpty,
                          style: const TextStyle(color: AppColors.graphite),
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: state.stateData.entries.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        DictionaryEntry entry = state.stateData.entries[index];
                        return DictionaryEntryCard(entry: entry);
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
