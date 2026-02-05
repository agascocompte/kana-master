import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/pages/dictionary/dictionary.dart';
import 'package:kana_master/pages/home/bloc/home_nav_cubit.dart';
import 'package:kana_master/pages/settings/settings.dart';
import 'package:kana_master/pages/stats/stats.dart';
import 'package:kana_master/pages/study/study.dart';
import 'package:kana_master/i18n/strings.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavCubit, int>(
      builder: (context, index) {
        return Scaffold(
          body: IndexedStack(
            index: index,
            children: const [
              StudyTab(),
              DictionaryTab(),
              StatsTab(),
              SettingsPage(),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (value) =>
                context.read<HomeNavCubit>().selectTab(value),
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.school_outlined),
                label: t.app.tabStudy,
              ),
              NavigationDestination(
                icon: const Icon(Icons.search),
                label: t.app.dictionary,
              ),
              NavigationDestination(
                icon: const Icon(Icons.bar_chart_outlined),
                label: t.app.tabStats,
              ),
              NavigationDestination(
                icon: const Icon(Icons.tune),
                label: t.app.settings,
              ),
            ],
          ),
        );
      },
    );
  }
}
