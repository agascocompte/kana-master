import 'package:kana_master/domain/models/kanji_entry.dart';

/// N5 kanji grouped by theme: numbers, days and nature, time, people,
/// directions, descriptions, places and things, verbs.
const String n5StudyOrder = '一二三四五六七八九十百千万円'
    '日月火水木金土山川天気雨'
    '年時間半午前後今毎'
    '人子女男父母友先生名'
    '上下中左右東西南北外'
    '大小長高白'
    '国学校本車電語何'
    '行来出入見聞読書話食休';

const List<String> _jlptOrder = ['n5', 'n4', 'n3', 'n2', 'n1'];

/// Order for browsing: N5 to N1, N5 by theme and the other levels from
/// fewest to most strokes. Only for display; the drawing model relies on the
/// stored order.
List<KanjiEntry> sortForStudy(List<KanjiEntry> entries) {
  int levelRank(KanjiEntry entry) {
    final int index = _jlptOrder.indexOf(entry.jlpt.toLowerCase());
    return index == -1 ? _jlptOrder.length : index;
  }

  int themeRank(KanjiEntry entry) {
    final int index = n5StudyOrder.indexOf(entry.character);
    return index == -1 ? n5StudyOrder.length : index;
  }

  final List<KanjiEntry> sorted = List.of(entries);
  final Map<KanjiEntry, int> original = {
    for (int i = 0; i < entries.length; i++) entries[i]: i,
  };
  sorted.sort((a, b) {
    int result = levelRank(a).compareTo(levelRank(b));
    if (result != 0) return result;
    result = themeRank(a).compareTo(themeRank(b));
    if (result != 0) return result;
    result = a.strokeCount.compareTo(b.strokeCount);
    if (result != 0) return result;
    return original[a]!.compareTo(original[b]!);
  });
  return sorted;
}
