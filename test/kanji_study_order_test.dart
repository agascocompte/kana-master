import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kana_master/domain/kanji_study_order.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';

void main() {
  test('N5 study order covers every N5 kanji exactly once', () {
    final lines = File('assets/csv/kanji_data.csv').readAsLinesSync().skip(1);
    final n5 = {
      for (final line in lines)
        if (line.split(',')[3] == 'N5') line.split(',')[0],
    };
    final ordered = n5StudyOrder.split('');
    expect(ordered.toSet().length, ordered.length);
    expect(ordered.toSet(), n5);
  });

  test('sortForStudy puts N5 first in theme order, then by strokes', () {
    KanjiEntry entry(String character, String jlpt, int strokes) => KanjiEntry(
          character: character,
          unicode: character.runes.first.toRadixString(16),
          readingsOn: const [],
          readingsKun: const [],
          readingsName: const [],
          strokeCount: strokes,
          jlpt: jlpt,
        );
    final sorted = sortForStudy([
      entry('愛', 'N3', 13),
      entry('三', 'N5', 3),
      entry('一', 'N5', 1),
      entry('委', 'N2', 8),
      entry('力', 'N4', 2),
      entry('円', 'N5', 4),
      entry('区', 'N3', 4),
    ]);
    expect(sorted.map((e) => e.character).join(), '一三円力区愛委');
  });
}
