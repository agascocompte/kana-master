import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/domain/models/dictionary_entry.dart';
import 'package:kana_master/pages/dictionary/bloc/dictionary_bloc.dart';
import 'package:kana_master/pages/dictionary/widgets/dictionary_entry_card.dart';
import 'package:kana_master/pages/dictionary/widgets/search_action_bar.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

/// Dictionary opened from the search button of the study tab.
class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mist,
      appBar: AppBar(),
      body: const DictionaryTab(),
    );
  }
}

class DictionaryTab extends StatelessWidget {
  const DictionaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.mist, AppColors.sand],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
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
                style: TextStyle(color: AppColors.slate, fontSize: 14),
              ),
              const SizedBox(height: 16),
              SearchActionBar(),
              // Jisho only returns English glosses.
              if (TranslationProvider.of(context).locale != AppLocale.en) ...[
                const SizedBox(height: 8),
                Text(
                  tr.app.dictionaryEnglishNote,
                  style: TextStyle(color: AppColors.slate, fontSize: 12),
                ),
              ],
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<DictionaryBloc, DictionaryState>(
                  builder: (context, state) {
                    if (state is DictionaryLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.ink,
                        ),
                      );
                    }

                    if (state is DictionaryError &&
                        state.stateData.errorMessage.isNotEmpty) {
                      return Center(
                        child: Text(
                          tr.app.dictionaryError,
                          style: TextStyle(color: AppColors.coral),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    if (state.stateData.entries.isEmpty) {
                      return Center(
                        child: Text(
                          tr.app.dictionaryEmpty,
                          style: TextStyle(color: AppColors.graphite),
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
