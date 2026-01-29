import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/kana_entry.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/domain/repositories/kanji_meanings_repository.dart';
import 'package:kana_master/domain/repositories/kanji_repository.dart';
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
  Future<_KanjiData>? _kanjiDataFuture;
  final KanjiRepository _kanjiRepository = KanjiRepository();
  final KanjiMeaningsRepository _kanjiMeaningsRepository =
      KanjiMeaningsRepository();

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
  void didUpdateWidget(covariant StudyTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.kanaType != oldWidget.kanaType) {
      _kanjiDataFuture = null;
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
    _kanjiDataFuture ??=
        _loadKanjiData(Localizations.localeOf(context).languageCode);
    return FutureBuilder<_KanjiData>(
      future: _kanjiDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final data = snapshot.data ??
            const _KanjiData(entries: [], meanings: {});
        return LearnTab(
          entries: const [],
          kanaType: widget.kanaType,
          kanjiEntries: data.entries,
          kanjiMeanings: data.meanings,
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
    _kanjiDataFuture ??=
        _loadKanjiData(Localizations.localeOf(context).languageCode);
    return FutureBuilder<_KanjiData>(
      future: _kanjiDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        final data = snapshot.data ??
            const _KanjiData(entries: [], meanings: {});
        return TestTab(
          kanaType: widget.kanaType,
          kana: const {},
          kanjiEntries: data.entries,
          kanjiMeanings: data.meanings,
          difficultyLevel: widget.difficultyLevel,
        );
      },
    );
  }

  Future<_KanjiData> _loadKanjiData(String languageCode) async {
    await _kanjiRepository.ensureKanjiImported();
    final entries = await _kanjiRepository.getAllKanji();
    final meanings = await _kanjiMeaningsRepository.loadMeanings(languageCode);
    return _KanjiData(entries: entries, meanings: meanings);
  }
}

class _KanjiData {
  final List<KanjiEntry> entries;
  final Map<String, List<String>> meanings;

  const _KanjiData({
    required this.entries,
    required this.meanings,
  });
}
