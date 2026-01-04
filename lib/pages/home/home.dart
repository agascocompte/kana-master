import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/pages/dictionary/dictionary.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/study/study.dart';
import 'package:kana_master/router/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kana Master",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push(AppRouter.statsRoute),
            icon: const Icon(Icons.bar_chart_outlined),
          ),
          IconButton(
            onPressed: () => context.push(AppRouter.settingsRoute),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              StudyTab(
                kana: state.stateData.kanaType == KanaType.hiragana
                    ? hiragana
                    : katakana,
                difficultyLevel: state.stateData.difficultyLevel,
              ),
              const DictionaryTab(),
            ],
          );
        },
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: TabBar(
            labelColor: jDarkBLue,
            unselectedLabelColor: jLightBLue,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: jOrange, width: 3),
              insets: EdgeInsets.zero,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(fontWeight: FontWeight.w700),
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.school_outlined), text: "Study"),
              Tab(icon: Icon(Icons.search), text: "Dictionary"),
            ],
          ),
        ),
      ),
    );
  }
}
