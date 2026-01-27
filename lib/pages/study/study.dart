import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
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
  Future<List<KanjiEntry>>? _kanjiEntriesFuture;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    if (widget.kanaType == KanaType.kanji) {
      _kanjiEntriesFuture = loadKanjiEntriesFromCsv();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant StudyTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.kanaType == KanaType.kanji &&
        oldWidget.kanaType != KanaType.kanji) {
      _kanjiEntriesFuture = loadKanjiEntriesFromCsv();
    }
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
              _buildLearnTab(),
              _buildTestTab(),
              const MaterialTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLearnTab() {
    if (widget.kanaType != KanaType.kanji) {
      return LearnTab(
        entries: widget.kanaEntries,
        kanaType: widget.kanaType,
      );
    }
    return FutureBuilder<List<KanjiEntry>>(
      future: _kanjiEntriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final entries = snapshot.data ?? const <KanjiEntry>[];
        return LearnTab(
          entries: const [],
          kanaType: widget.kanaType,
          kanjiEntries: entries,
        );
      },
    );
  }

  Widget _buildTestTab() {
    if (widget.kanaType != KanaType.kanji) {
      return TestTab(
        kanaType: widget.kanaType,
        kana: widget.kanaMap,
        difficultyLevel: widget.difficultyLevel,
      );
    }
    return FutureBuilder<List<KanjiEntry>>(
      future: _kanjiEntriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final entries = snapshot.data ?? const <KanjiEntry>[];
        return TestTab(
          kanaType: widget.kanaType,
          kana: const {},
          kanjiEntries: entries,
          difficultyLevel: widget.difficultyLevel,
        );
      },
    );
  }
}
