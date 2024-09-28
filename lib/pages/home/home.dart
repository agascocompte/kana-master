import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/learn/learn.dart';
import 'package:hiragana_japanesse/pages/settings/bloc/settings_bloc.dart';
import 'package:hiragana_japanesse/pages/stats/stats.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/test_hiragana.dart';
import 'package:hiragana_japanesse/router/router.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
        title: Text("Kana Master"),
        backgroundColor: jOrange,
        actions: [
          IconButton(
            onPressed: () => context.push(AppRouter.settingsRoute),
            icon: Icon(Icons.settings),
            color: Colors.black,
          ),
        ],
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              LearnTab(
                kana: state.stateData.kanaType == KanaType.hiragana
                    ? hiragana
                    : katakana,
              ),
              TestHiraganaTab(),
              StatsTab(),
            ],
          );
        },
      ),
      bottomNavigationBar: Material(
        color: Colors.grey[200],
        child: TabBar(
          labelColor: jOrange,
          indicatorColor: jOrange,
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.list), text: "Learn"),
            Tab(icon: Icon(Icons.create), text: "Test"),
            Tab(icon: Icon(Icons.bar_chart), text: "Stats"),
          ],
        ),
      ),
    );
  }
}
