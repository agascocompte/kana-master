import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/pages/learn_hiragana/learn_hiragana.dart';
import 'package:hiragana_japanesse/pages/stats/stats.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/test_hiragana.dart';

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
        title: const Center(child: Text("Kana Master")),
        backgroundColor: jOrange,
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          LearnHiraganaTab(),
          TestHiraganaTab(),
          StatsTab(),
        ],
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
