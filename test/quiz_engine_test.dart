import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/kana_converter.dart';
import 'package:kana_master/domain/models/kana_groups.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/domain/quiz_engine.dart';

KanjiEntry _kanji(String char, String unicode,
        {List<String> on = const [], List<String> kun = const []}) =>
    KanjiEntry(
      character: char,
      unicode: unicode,
      readingsOn: on,
      readingsKun: kun,
      readingsName: const [],
      strokeCount: 1,
      jlpt: 'N5',
    );

void main() {
  group('KanaConverter', () {
    test('romaji to hiragana', () {
      expect(KanaConverter.romajiToHiragana('ka'), 'か');
      expect(KanaConverter.romajiToHiragana('shi'), 'し');
      expect(KanaConverter.romajiToHiragana('si'), 'し');
      expect(KanaConverter.romajiToHiragana('tsu'), 'つ');
      expect(KanaConverter.romajiToHiragana('tu'), 'つ');
      expect(KanaConverter.romajiToHiragana('kya'), 'きゃ');
      expect(KanaConverter.romajiToHiragana('sya'), 'しゃ');
      expect(KanaConverter.romajiToHiragana('nichi'), 'にち');
      expect(KanaConverter.romajiToHiragana('kanji'), 'かんじ');
      expect(KanaConverter.romajiToHiragana('konnichiwa'), 'こんにちわ');
      expect(KanaConverter.romajiToHiragana("kan'i"), 'かんい');
      expect(KanaConverter.romajiToHiragana('gakkou'), 'がっこう');
      expect(KanaConverter.romajiToHiragana('matcha'), 'まっちゃ');
      expect(KanaConverter.romajiToHiragana('hon'), 'ほん');
      expect(KanaConverter.romajiToHiragana('xyz'), isNull);
    });

    test('katakana folds to hiragana', () {
      expect(KanaConverter.toHiragana('ニチ'), 'にち');
      expect(KanaConverter.normalizeToHiragana('ジツ'), 'じつ');
      expect(KanaConverter.normalizeToHiragana(' Nichi '), 'にち');
    });
  });

  group('kana pools', () {
    test('default hiragana groups match the original 71 kana', () {
      final pool = QuizEngine.kanaPool(
          KanaType.hiragana, defaultKanaGroupIds(KanaType.hiragana));
      expect(pool.length, hiragana.length);
      expect(pool.every((i) => i.drawable && i.modelClass != null), isTrue);
      final ka = pool.firstWhere((i) => i.symbol == 'か');
      expect(ka.modelClass, hiragana.keys.toList().indexOf('か'));
      expect(ka.strokeAsset, 'assets/svg/hiragana/0304b.svg');
    });

    test('katakana model classes follow katakanaModelLabels', () {
      final pool = QuizEngine.kanaPool(
          KanaType.katakana, defaultKanaGroupIds(KanaType.katakana));
      final n = pool.firstWhere((i) => i.symbol == 'ン');
      expect(n.modelClass, katakanaModelLabels.indexOf('ン'));
      final ga = pool.firstWhere((i) => i.symbol == 'ガ');
      expect(ga.drawable, isFalse);
      expect(ga.modelClass, isNull);
    });

    test('combos are quiz-only', () {
      final pool = QuizEngine.kanaPool(KanaType.hiragana, {'h-combo'});
      expect(pool.length, 33);
      expect(pool.any((i) => i.drawable), isFalse);
    });
  });

  group('answer checking', () {
    final pool = QuizEngine.kanaPool(KanaType.hiragana,
        {...defaultKanaGroupIds(KanaType.hiragana), 'h-combo'});
    QuizItem kana(String s) => pool.firstWhere((i) => i.symbol == s);

    test('romaji variants and kana', () {
      expect(QuizEngine.checkTypedAnswer(kana('し'), 'shi'), isTrue);
      expect(QuizEngine.checkTypedAnswer(kana('し'), ' SI '), isTrue);
      expect(QuizEngine.checkTypedAnswer(kana('し'), 'し'), isTrue);
      expect(QuizEngine.checkTypedAnswer(kana('ぢ'), 'ji'), isTrue);
      expect(QuizEngine.checkTypedAnswer(kana('しゃ'), 'sya'), isTrue);
      expect(QuizEngine.checkTypedAnswer(kana('か'), 'ki'), isFalse);
      expect(QuizEngine.checkTypedAnswer(kana('か'), ''), isFalse);
    });

    test('kanji meanings and readings', () {
      final entries = [
        _kanji('日', '065e5', on: ['ニチ', 'ジツ'], kun: ['ひ', '-び', '-か']),
        _kanji('愛', '0611b', on: ['アイ'], kun: ['いと.しい']),
      ];
      final meanings = {
        '065e5': ['day', 'sun'],
        '0611b': ['love', 'affection (deep)'],
      };
      final meaningPool = QuizEngine.kanjiPool(
          entries: entries,
          modelEntries: entries,
          meanings: meanings,
          mode: KanjiQuizMode.meaning);
      final readingPool = QuizEngine.kanjiPool(
          entries: entries,
          modelEntries: entries,
          meanings: meanings,
          mode: KanjiQuizMode.reading);

      expect(QuizEngine.checkTypedAnswer(meaningPool[0], 'Sun'), isTrue);
      expect(QuizEngine.checkTypedAnswer(meaningPool[1], 'affection'), isTrue);
      expect(QuizEngine.checkTypedAnswer(meaningPool[1], 'lov'), isFalse);

      expect(readingPool[0].label, 'ニチ・ジツ / ひ・び');
      expect(QuizEngine.checkTypedAnswer(readingPool[0], 'nichi'), isTrue);
      expect(QuizEngine.checkTypedAnswer(readingPool[0], 'にち'), isTrue);
      expect(QuizEngine.checkTypedAnswer(readingPool[0], 'ジツ'), isTrue);
      expect(QuizEngine.checkTypedAnswer(readingPool[0], 'hi'), isTrue);
      expect(QuizEngine.checkTypedAnswer(readingPool[1], 'itoshii'), isTrue);
      expect(QuizEngine.checkTypedAnswer(readingPool[1], 'ito'), isTrue);
      expect(QuizEngine.checkTypedAnswer(readingPool[1], 'ai'), isTrue);
      expect(QuizEngine.checkTypedAnswer(readingPool[1], 'koi'), isFalse);
    });
  });

  group('picking', () {
    final pool = QuizEngine.kanaPool(
        KanaType.hiragana, defaultKanaGroupIds(KanaType.hiragana));

    test('options keep the correct answer and have distinct labels', () {
      final engine = QuizEngine(random: math.Random(1));
      final ji = pool.firstWhere((i) => i.symbol == 'ぢ');
      for (int run = 0; run < 200; run++) {
        final options = engine.options(ji, pool);
        expect(options.length, 4);
        expect(options.contains(ji), isTrue);
        expect(options.map((o) => o.label).toSet().length, 4);
      }
    });

    test('weak items are picked more often than mastered ones', () {
      final engine = QuizEngine(random: math.Random(7));
      final small = pool.take(2).toList();
      final stats = {
        small[0].symbol: const ItemStat(
            correct: 5, incorrect: 0, recent: [true, true, true]),
        small[1].symbol: const ItemStat(
            correct: 1, incorrect: 4, recent: [false, false, true, false]),
      };
      int weakPicks = 0;
      for (int i = 0; i < 1000; i++) {
        if (engine.pick(small, stats: stats) == small[1]) weakPicks++;
      }
      expect(weakPicks, greaterThan(800));
    });

    test('does not repeat the previous item or excluded ones', () {
      final engine = QuizEngine(random: math.Random(3));
      final small = pool.take(3).toList();
      for (int i = 0; i < 100; i++) {
        final next = engine.pick(small,
            stats: const {}, exclude: {small[0]}, previous: small[1]);
        expect(next, small[2]);
      }
    });

    test('item stat mastery', () {
      var stat = const ItemStat();
      stat = stat.record(false).record(true).record(true);
      expect(stat.mastered, isFalse);
      stat = stat.record(true);
      expect(stat.mastered, isTrue);
      expect(stat.weak, isFalse);
      expect(stat.record(false).weak, isTrue);
    });
  });
}
