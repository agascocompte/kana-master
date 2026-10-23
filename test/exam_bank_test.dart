import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:kana_master/domain/exam/exam_bank.dart';
import 'package:kana_master/domain/exam/exam_builder.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/domain/exam/exam_scoring.dart';

Map<Mondai, String> _sources() => {
      for (final m in Mondai.values)
        if (File(examBankAsset(m)).existsSync())
          m: File(examBankAsset(m)).readAsStringSync(),
    };

/// Explanations and translations of every bank in [language].
Map<Mondai, String> _textsOf(String language) => {
      for (final m in Mondai.values)
        m: File(examTextsAsset(language, m)).readAsStringSync(),
    };

List<Map<String, dynamic>> _raw(Mondai m) =>
    (json.decode(File(examBankAsset(m)).readAsStringSync()) as List<dynamic>)
        .cast<Map<String, dynamic>>();

/// Every piece of text a question shows, to check its marks.
Iterable<String> _texts(Map<String, dynamic> item) sync* {
  for (final key in ['q', 'text', 'pre', 'post', 'intro', 'situation']) {
    if (item[key] is String) yield item[key] as String;
  }
  for (final key in ['o', 'parts']) {
    for (final o in (item[key] as List<dynamic>? ?? const [])) {
      if (o is String) yield o;
    }
  }
  for (final key in ['blanks', 'qs']) {
    for (final sub in (item[key] as List<dynamic>? ?? const [])) {
      yield* _texts(sub as Map<String, dynamic>);
    }
  }
}

void main() {
  final bank = ExamBank.fromJsonStrings(_sources(), texts: _textsOf('es'));

  group('item banks', () {
    test('every question type has a bank file', () {
      for (final m in Mondai.values) {
        expect(File(examBankAsset(m)).existsSync(), isTrue,
            reason: 'missing ${examBankAsset(m)}');
      }
    });

    test('ids are unique across all banks', () {
      final seen = <String>{};
      for (final m in Mondai.values) {
        for (final item in _raw(m)) {
          final id = item['id'] as String;
          expect(seen.add(id), isTrue, reason: 'duplicate id $id');
        }
      }
    });

    test('options are complete and distinct', () {
      for (final m in Mondai.values) {
        final expected = m.hasSpokenOptions ? 3 : 4;
        for (final item in _raw(m)) {
          final groups = <List<dynamic>>[
            if (item['o'] != null) item['o'] as List<dynamic>,
            if (item['parts'] != null) item['parts'] as List<dynamic>,
            for (final sub in [
              ...(item['blanks'] as List<dynamic>? ?? const []),
              ...(item['qs'] as List<dynamic>? ?? const []),
            ])
              (sub as Map<String, dynamic>)['o'] as List<dynamic>,
          ];
          expect(groups, isNotEmpty, reason: '${item['id']} has no options');
          for (final options in groups) {
            expect(options.length, expected,
                reason: '${item['id']} should have $expected options');
            expect(options.toSet().length, options.length,
                reason: '${item['id']} repeats an option: $options');
            for (final o in options) {
              expect((o as String).trim(), isNotEmpty,
                  reason: '${item['id']} has an empty option');
            }
          }
        }
      }
    });

    test('markup is well formed', () {
      final ruby = RegExp(r'\[([^\[\]|]+)\|([^\[\]|]+)\]');
      for (final m in Mondai.values) {
        for (final item in _raw(m)) {
          for (final text in _texts(item)) {
            final stripped =
                text.replaceAll(ruby, '').replaceAll(RegExp(r'\[\[\d\]\]'), '');
            expect(stripped.contains('[') || stripped.contains(']'), isFalse,
                reason: '${item['id']}: broken furigana in "$text"');
            expect('{'.allMatches(text).length, '}'.allMatches(text).length,
                reason: '${item['id']}: unbalanced underline in "$text"');
          }
        }
      }
    });

    test('vocabulary questions underline or blank the tested word', () {
      for (final m in [
        Mondai.kanjiReading,
        Mondai.orthography,
        Mondai.paraphrase
      ]) {
        for (final item in _raw(m)) {
          expect('{'.allMatches(item['q'] as String).length, 1,
              reason: '${item['id']} must underline exactly one part');
        }
      }
      for (final m in [Mondai.contextual, Mondai.grammarForm]) {
        for (final item in _raw(m)) {
          expect((item['q'] as String).contains('（　　）'), isTrue,
              reason: '${item['id']} has no blank');
        }
      }
    });

    test('passages have their blanks and questions', () {
      for (final item in _raw(Mondai.textGrammar)) {
        final blanks = item['blanks'] as List<dynamic>;
        expect(blanks.length, Mondai.textGrammar.count,
            reason: '${item['id']}');
        for (var i = 1; i <= blanks.length; i++) {
          expect('[[$i]]'.allMatches(item['text'] as String).length, 1,
              reason: '${item['id']} blank $i');
        }
      }
      for (final item in _raw(Mondai.midReading)) {
        expect((item['qs'] as List<dynamic>).length, Mondai.midReading.count,
            reason: '${item['id']}');
      }
      for (final item in _raw(Mondai.sentenceOrder)) {
        expect(item['star'], inInclusiveRange(0, 3), reason: '${item['id']}');
      }
    });

    test('spoken answers point at an option', () {
      for (final m in [Mondai.utterance, Mondai.quickResponse]) {
        for (final item in _raw(m)) {
          expect(item['a'], inInclusiveRange(0, 2), reason: '${item['id']}');
        }
      }
    });

    test('every question has its Spanish translation', () {
      final paper =
          ExamBuilder(bank: bank, rng: Random(2)).build(ExamSection.values);
      for (final m in Mondai.values) {
        for (final item in bank.items[m]!) {
          for (final q in item.toQuestions(Random(1), 1)) {
            final passageOnly = m == Mondai.textGrammar;
            if (!passageOnly) {
              expect(q.translation?.trim(), isNotEmpty, reason: q.itemId);
            }
            if (q.passage != null) {
              expect(q.passage!.translation?.trim(), isNotEmpty,
                  reason: q.itemId);
            }
          }
        }
      }
      expect(
          paper.allQuestions.every(
              (q) => q.translation != null || q.passage?.translation != null),
          isTrue);
    });

    test('every language has the texts of every question', () {
      for (final language in examTextLanguages) {
        final localized =
            ExamBank.fromJsonStrings(_sources(), texts: _textsOf(language));
        for (final m in Mondai.values) {
          for (final item in localized.items[m]!) {
            for (final q in item.toQuestions(Random(1), 1)) {
              final where = '$language ${q.itemId}';
              expect(q.explanation.trim(), isNotEmpty, reason: where);
              if (m != Mondai.textGrammar) {
                expect(q.translation?.trim(), isNotEmpty, reason: where);
              }
              if (q.passage != null) {
                expect(q.passage!.translation?.trim(), isNotEmpty,
                    reason: where);
              }
            }
          }
        }
      }
    });

    test('each bank fills several tests', () {
      for (final m in Mondai.values) {
        final questions =
            bank.items[m]!.fold<int>(0, (n, i) => n + i.questionCount);
        expect(questions, greaterThanOrEqualTo(m.count * 5),
            reason: '${m.name} has only $questions questions');
      }
    });
  });

  group('ExamBuilder', () {
    test('a saved test comes back the same for the review', () {
      final paper =
          ExamBuilder(bank: bank, rng: Random(5)).build(ExamSection.values);
      final all = paper.allQuestions;
      final answers = {
        for (var i = 0; i < all.length; i++)
          if (i % 7 != 0) all[i]: i % all[i].options.length,
      };
      final stored = json.encode(ExamRecordCodec.encode(paper, answers));
      final (copy, copyAnswers) =
          ExamRecordCodec.decode(json.decode(stored) as Map<String, dynamic>);
      expect(copy.sections, paper.sections);
      final copied = copy.allQuestions;
      expect(copied.length, all.length);
      for (var i = 0; i < all.length; i++) {
        final a = all[i], b = copied[i];
        expect(b.itemId, a.itemId);
        expect(b.mondai, a.mondai);
        expect(b.number, a.number);
        expect(b.stem, a.stem);
        expect(b.options, a.options);
        expect(b.correctIndex, a.correctIndex);
        expect(b.explanation, a.explanation);
        expect(b.passage?.text, a.passage?.text);
        expect(b.clip?.audioAsset, a.clip?.audioAsset);
        expect(b.clip?.scene, a.clip?.scene);
        expect(
          b.clip?.script.map((l) => '${l.speaker}:${l.text}').toList(),
          a.clip?.script.map((l) => '${l.speaker}:${l.text}').toList(),
        );
        expect(b.orderBefore, a.orderBefore);
        expect(b.orderAfter, a.orderAfter);
        expect(b.starSlot, a.starSlot);
        expect(b.orderSolution, a.orderSolution);
        expect(b.translation, a.translation);
        expect(b.passage?.translation, a.passage?.translation);
        expect(copyAnswers[b], answers[a]);
      }
      expect(
        ExamScore.grade(copied, copyAnswers).toJson(),
        ExamScore.grade(all, answers).toJson(),
      );
    });

    test('every listening item has its recording', () {
      final names = [
        for (final m in ExamSection.listening.mondai) ...[
          'inst_${m.name}',
          for (final item in bank.items[m]!) item.id,
        ],
        for (var n = 1; n <= 7; n++) 'num_$n',
      ];
      for (final name in names) {
        final file = File(examAudioAsset(name));
        expect(file.existsSync(), isTrue, reason: 'missing ${file.path}');
        expect(file.lengthSync(), greaterThan(5000), reason: file.path);
      }
    });

    test('consecutive tests do not repeat items until a bank runs out', () {
      final history = <String, ItemHistory>{};
      final seen = <String>{};
      var time = DateTime(2026, 10, 21);
      // As many full tests as the smallest bank allows.
      final runs = Mondai.values
          .map((m) =>
              bank.items[m]!.fold<int>(0, (n, i) => n + i.questionCount) ~/
              m.count)
          .reduce(min);
      for (var run = 0; run < runs; run++) {
        final paper =
            ExamBuilder(bank: bank, history: history, rng: Random(run))
                .build(ExamSection.values);
        final ids = paper.allQuestions.map((q) => q.itemId.split('#').first);
        for (final id in ids.toSet()) {
          expect(seen.add(id), isTrue,
              reason: '$id repeated in test ${run + 1}');
          history[id] = ItemHistory(seen: 1, lastSeen: time);
        }
        time = time.add(const Duration(hours: 8));
      }
      expect(runs, greaterThanOrEqualTo(20));
    });

    test('a full test has the official number of questions', () {
      final paper =
          ExamBuilder(bank: bank, rng: Random(1)).build(ExamSection.values);
      expect(paper.questions[ExamSection.vocabulary]!.length, 21);
      expect(paper.questions[ExamSection.grammarReading]!.length, 22);
      expect(paper.questions[ExamSection.listening]!.length, 24);
      for (final m in Mondai.values) {
        expect(paper.allQuestions.where((q) => q.mondai == m).length, m.count,
            reason: m.name);
      }
    });

    test('written sections number continuously, listening per もんだい', () {
      final paper =
          ExamBuilder(bank: bank, rng: Random(2)).build(ExamSection.values);
      for (final section in [
        ExamSection.vocabulary,
        ExamSection.grammarReading
      ]) {
        final numbers = paper.questions[section]!.map((q) => q.number).toList();
        expect(numbers, List.generate(numbers.length, (i) => i + 1));
      }
      for (final m in ExamSection.listening.mondai) {
        final numbers = paper.questions[ExamSection.listening]!
            .where((q) => q.mondai == m)
            .map((q) => q.number)
            .toList();
        expect(numbers, List.generate(m.count, (i) => i + 1));
      }
    });

    test('the right answer is marked after shuffling', () {
      final paper =
          ExamBuilder(bank: bank, rng: Random(3)).build(ExamSection.values);
      final firstById = {
        for (final m in Mondai.values)
          for (final item in _raw(m)) item['id'] as String: item,
      };
      for (final q in paper.allQuestions) {
        final raw = firstById[q.itemId];
        if (raw == null || q.mondai.hasSpokenOptions) continue;
        if (q.mondai == Mondai.sentenceOrder) {
          final parts = (raw['parts'] as List<dynamic>).cast<String>();
          expect(q.options[q.correctIndex], parts[raw['star'] as int]);
        } else {
          expect(q.options[q.correctIndex], (raw['o'] as List<dynamic>).first);
        }
      }
    });

    test('unseen items come before seen ones', () {
      final kanji = bank.items[Mondai.kanjiReading]!;
      final seen = {
        for (final item in kanji.skip(Mondai.kanjiReading.count))
          item.id: ItemHistory(seen: 1, lastSeen: DateTime(2026, 10, 1)),
      };
      final paper = ExamBuilder(bank: bank, history: seen, rng: Random(4))
          .build([ExamSection.vocabulary]);
      final picked = paper.allQuestions
          .where((q) => q.mondai == Mondai.kanjiReading)
          .map((q) => q.itemId)
          .toSet();
      expect(picked,
          kanji.take(Mondai.kanjiReading.count).map((i) => i.id).toSet());
    });

    test('failed items come back before ones answered right', () {
      final kanji = bank.items[Mondai.kanjiReading]!;
      final history = {
        for (final item in kanji)
          item.id: ItemHistory(seen: 1, lastSeen: DateTime(2026, 10, 1)),
      };
      final failed = kanji.last.id;
      history[failed] = ItemHistory(
        seen: 1,
        lastSeen: DateTime(2026, 10, 2),
        lastCorrect: false,
      );
      final paper = ExamBuilder(bank: bank, history: history, rng: Random(5))
          .build([ExamSection.vocabulary]);
      expect(paper.allQuestions.map((q) => q.itemId), contains(failed));
    });

    test('textGrammar blanks show the question numbers', () {
      final paper = ExamBuilder(bank: bank, rng: Random(6))
          .build([ExamSection.grammarReading]);
      final tg = paper.allQuestions
          .where((q) => q.mondai == Mondai.textGrammar)
          .toList();
      for (final q in tg) {
        expect(q.passage!.text, contains('［${q.number}］'));
        expect(q.passage!.text, isNot(contains('[[')));
      }
    });
  });

  group('ExamScore', () {
    ExamQuestion question(Mondai m) => ExamQuestion(
          itemId: 'x',
          mondai: m,
          number: 1,
          stem: '',
          options: const ['a', 'b', 'c', 'd'],
          correctIndex: 0,
        );

    test('all right gives 120 + 60', () {
      final qs = [
        for (final m in Mondai.values)
          for (var i = 0; i < m.count; i++) question(m),
      ];
      final score = ExamScore.grade(qs, {for (final q in qs) q: 0});
      expect(score.languagePoints, 120);
      expect(score.listeningPoints, 60);
      expect(score.passed, isTrue);
    });

    test('a weak listening fails even with a good total', () {
      final qs = [
        for (final m in Mondai.values)
          for (var i = 0; i < m.count; i++) question(m),
      ];
      final answers = {
        for (final q in qs) q: q.mondai.isListening ? 1 : 0,
      };
      final score = ExamScore.grade(qs, answers);
      expect(score.totalPoints, 120);
      expect(score.listeningPassed, isFalse);
      expect(score.passed, isFalse);
    });

    test('round-trips through JSON', () {
      final score = ExamScore({
        Mondai.kanjiReading: const Tally(5, 7),
        Mondai.quickResponse: const Tally(2, 6),
      });
      final copy = ExamScore.fromJson(
          json.decode(json.encode(score.toJson())) as Map<String, dynamic>);
      expect(copy.byMondai[Mondai.kanjiReading]!.correct, 5);
      expect(copy.byMondai[Mondai.quickResponse]!.total, 6);
    });
  });
}
