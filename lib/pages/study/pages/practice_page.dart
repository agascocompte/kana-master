import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/pages/learn/bloc/learn_bloc.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/test_kana/test_kana.dart';
import 'package:kana_master/theme/app_theme.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
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
            )),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Practice'),
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.mist, AppColors.sand],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
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
                            child: Text(learnState.stateData.errorMessage),
                          );
                        }
                        return TestTab(
                          kanaType: kanaType,
                          kana: const {},
                          kanjiEntries: learnState.stateData.kanjiEntries,
                          kanjiMeanings: learnState.stateData.kanjiMeanings,
                          difficultyLevel: settingsState.stateData.difficultyLevel,
                        );
                      },
                    )
                  : TestTab(
                      kanaType: kanaType,
                      kana: kanaMap,
                      difficultyLevel: settingsState.stateData.difficultyLevel,
                    ),
            ),
          ),
        );
      },
    );
  }
}
