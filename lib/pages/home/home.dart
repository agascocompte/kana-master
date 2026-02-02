import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/pages/dictionary/dictionary.dart';
import 'package:kana_master/pages/home/bloc/home_nav_cubit.dart';
import 'package:kana_master/pages/stats/stats.dart';
import 'package:kana_master/pages/study/study.dart';

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
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (value) =>
                context.read<HomeNavCubit>().selectTab(value),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.school_outlined),
                label: 'Study',
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Dictionary',
              ),
              NavigationDestination(
                icon: Icon(Icons.bar_chart_outlined),
                label: 'Stats',
              ),
            ],
          ),
        );
      },
    );
  }
}
