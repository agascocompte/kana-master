import 'dart:math';

import 'package:kana_master/domain/exam/exam_bank.dart';
import 'package:kana_master/domain/exam/exam_models.dart';

/// What the user did with a bank item in earlier tests.
class ItemHistory {
  final int seen;
  final DateTime? lastSeen;
  final bool lastCorrect;

  const ItemHistory({this.seen = 0, this.lastSeen, this.lastCorrect = true});
}

/// Puts together a test with the official number of items per もんだい.
///
/// Items never seen come first, then the ones failed last time, then the
/// rest from the longest ago, so the bank is gone through before anything
/// repeats and mistakes come back sooner.
class ExamBuilder {
  final ExamBank bank;
  final Map<String, ItemHistory> history;
  final Random rng;

  ExamBuilder({required this.bank, this.history = const {}, Random? rng})
      : rng = rng ?? Random();

  ExamPaper build(List<ExamSection> sections) {
    final usedTags = <String>{};
    final questions = <ExamSection, List<ExamQuestion>>{};
    for (final section in sections) {
      final list = <ExamQuestion>[];
      for (final mondai in section.mondai) {
        // Listening restarts at １ばん in every もんだい.
        final first = mondai.isListening ? 1 : list.length + 1;
        list.addAll(_pick(mondai, first, usedTags));
      }
      questions[section] = list;
    }
    return ExamPaper(sections: sections, questions: questions);
  }

  List<ExamQuestion> _pick(Mondai mondai, int firstNumber, Set<String> used) {
    final ranked = _rank(bank.items[mondai] ?? const []);
    final picked = <BankItem>[];
    var count = 0;

    bool fits(BankItem item) => count + item.questionCount <= mondai.count;

    // Skip items testing a word already asked, unless nothing else is left.
    for (final avoidRepeats in [true, false]) {
      for (final item in ranked) {
        if (count == mondai.count) break;
        if (picked.contains(item) || !fits(item)) continue;
        if (avoidRepeats && item.tags.any(used.contains)) continue;
        picked.add(item);
        used.addAll(item.tags);
        count += item.questionCount;
      }
    }

    final questions = <ExamQuestion>[];
    var number = firstNumber;
    for (final item in picked) {
      final generated = item.toQuestions(rng, number);
      questions.addAll(generated);
      number += generated.length;
    }
    return questions;
  }

  List<BankItem> _rank(List<BankItem> items) {
    final shuffled = [...items]..shuffle(rng);
    int priority(BankItem item) {
      final h = history[item.id];
      if (h == null || h.seen == 0) return 0;
      return h.lastCorrect ? 2 : 1;
    }

    DateTime lastSeen(BankItem item) =>
        history[item.id]?.lastSeen ?? DateTime.fromMillisecondsSinceEpoch(0);

    // List.sort is not stable, so break ties with the shuffled position.
    final position = {
      for (var i = 0; i < shuffled.length; i++) shuffled[i]: i,
    };
    shuffled.sort((a, b) {
      final byPriority = priority(a).compareTo(priority(b));
      if (byPriority != 0) return byPriority;
      final bySeen = lastSeen(a).compareTo(lastSeen(b));
      if (bySeen != 0) return bySeen;
      return position[a]!.compareTo(position[b]!);
    });
    return shuffled;
  }
}
