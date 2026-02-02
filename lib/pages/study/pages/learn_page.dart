import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/pages/learn/bloc/learn_bloc.dart';
import 'package:kana_master/pages/learn/learn.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, settingsState) {
        final KanaType kanaType = settingsState.stateData.kanaType;
        final List<KanaEntry> entries = kanaType == KanaType.hiragana
            ? hiraganaEntries
            : kanaType == KanaType.katakana
                ? katakanaEntries
                : const [];
        return BlocProvider(
          create: (_) => sl<LearnBloc>()
            ..add(LearnInitialized(
              kanaType: kanaType,
              languageCode: languageCode,
            )),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Learn'),
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.mist, AppColors.sand],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: LearnTab(
                entries: entries,
                kanaType: kanaType,
              ),
            ),
          ),
        );
      },
    );
  }
}
