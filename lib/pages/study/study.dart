import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/pages/learn/learn.dart';
import 'package:kana_master/pages/test_kana/test_kana.dart';
import 'package:kana_master/pages/study/widgets/material_tab.dart';

class StudyTab extends StatefulWidget {
  final List<KanaEntry> kanaEntries;
  final Map<String, String> kanaMap;
  final KanaType kanaType;
  final DifficultyLevel difficultyLevel;

  const StudyTab({
    super.key,
    required this.kanaEntries,
    required this.kanaMap,
    required this.kanaType,
    required this.difficultyLevel,
  });

  @override
  State<StudyTab> createState() => _StudyTabState();
}

class _StudyTabState extends State<StudyTab>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          child: TabBar(
            controller: _controller,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: jOrange, width: 3),
              insets: EdgeInsets.zero,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(fontWeight: FontWeight.w700),
            labelColor: jDarkBLue,
            unselectedLabelColor: jLightBLue,
            tabs: const [
              Tab(text: "Learn"),
              Tab(text: "Test"),
              Tab(text: "Material"),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              LearnTab(
                entries: widget.kanaEntries,
                kanaType: widget.kanaType,
              ),
              TestTab(
                kana: widget.kanaMap,
                difficultyLevel: widget.difficultyLevel,
              ),
              const MaterialTab(),
            ],
          ),
        ),
      ],
    );
  }
}
