import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/pages/learn/bloc/learn_bloc.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/test_kana/test_kana.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
        final languageCode = settingsState.stateData.languageCode;
        final KanaType kanaType = settingsState.stateData.kanaType;
        final Map<String, String> kanaMap = kanaType == KanaType.hiragana
            ? hiragana
            : kanaType == KanaType.katakana
                ? katakana
                : const {};
        return BlocProvider(
          create: (_) => sl<LearnBloc>()
            ..add(LearnInitialized(
              kanaType: kanaType,
              languageCode: languageCode,
              jlptFilter: settingsState.stateData.kanjiJlptFilter,
            )),
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.mist, AppColors.sand],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 18, 16, 6),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: const Icon(Icons.arrow_back),
                            color: AppColors.ink,
                            tooltip: t.app.back,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            t.app.practice,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: AppColors.ink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: Text(
                        t.app.practiceSubtitle,
                        style: const TextStyle(
                          color: AppColors.slate,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: kanaType == KanaType.kanji
                          ? BlocBuilder<LearnBloc, LearnState>(
                              builder: (context, learnState) {
                                if (learnState is LearnLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (learnState is LearnError) {
                                  return Center(
                                    child:
                                        Text(learnState.stateData.errorMessage),
                                  );
                                }
                                if (learnState
                                    .stateData.filteredKanjiEntries.isEmpty) {
                                  return Center(
                                    child: Text(t.app.kanjiFilterEmpty),
                                  );
                                }
                                return TestTab(
                                  kanaType: kanaType,
                                  kana: const {},
                                  kanjiEntries:
                                      learnState.stateData.filteredKanjiEntries,
                                  kanjiMeanings:
                                      learnState.stateData.kanjiMeanings,
                                  difficultyLevel:
                                      settingsState.stateData.difficultyLevel,
                                  kanaScale: settingsState.stateData.kanaScale,
                                );
                              },
                            )
                          : TestTab(
                              kanaType: kanaType,
                              kana: kanaMap,
                              difficultyLevel:
                                  settingsState.stateData.difficultyLevel,
                              kanaScale: settingsState.stateData.kanaScale,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
