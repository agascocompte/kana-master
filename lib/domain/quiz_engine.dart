import 'dart:math' as math;

import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/kana_converter.dart';
import 'package:kana_master/domain/models/kana_groups.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/domain/models/quiz_item.dart';

/// Builds question pools, checks answers and picks questions.
class QuizEngine {
  QuizEngine({math.Random? random}) : _random = random ?? math.Random();

  final math.Random _random;

  // ---------------------------------------------------------------------------
  // Pools

  static List<QuizItem> kanaPool(KanaType type, Set<String> groupIds) {
    final List<String> modelLabels = type == KanaType.katakana
        ? katakanaModelLabels
        : hiragana.keys.toList(growable: false);
    final Map<String, String> drawableMap =
        type == KanaType.katakana ? katakana : hiragana;
    final String folder = type == KanaType.katakana ? 'katakana' : 'hiragana';

    final items = <QuizItem>[];
    for (final group in kanaGroupsFor(type)) {
      if (!groupIds.contains(group.id)) continue;
      for (final symbol in group.symbols) {
        final romaji = romajiForKana(symbol);
        if (romaji == null) continue;
        final bool drawable = drawableMap.containsKey(symbol);
        final int modelIndex = modelLabels.indexOf(symbol);
        items.add(QuizItem(
          symbol: symbol,
          label: romaji,
          drawPrompt: romaji,
          answers: [romaji],
          answerKind: AnswerKind.romaji,
          modelClass: drawable && modelIndex >= 0 ? modelIndex : null,
          strokeAsset: drawable
              ? 'assets/svg/$folder/${_codeFor(symbol).toLowerCase()}.svg'
              : null,
        ));
      }
    }
    return items;
  }

  /// [modelEntries] is the full kanji list in model class order; [entries] is
  /// the (possibly JLPT-filtered) pool to ask about.
  static List<QuizItem> kanjiPool({
    required List<KanjiEntry> entries,
    required List<KanjiEntry> modelEntries,
    required Map<String, List<String>> meanings,
    required KanjiQuizMode mode,
  }) {
    final Map<String, int> modelIndex = {
      for (int i = 0; i < modelEntries.length; i++) modelEntries[i].character: i,
    };
    final items = <QuizItem>[];
    for (final entry in entries) {
      final List<String> entryMeanings = meanings[entry.unicode] ?? const [];
      if (entryMeanings.isEmpty) continue;
      final String strokeAsset =
          'assets/svg/kanji/${entry.unicode.toUpperCase().padLeft(5, '0')}.svg';
      if (mode == KanjiQuizMode.meaning) {
        items.add(QuizItem(
          symbol: entry.character,
          label: entryMeanings.first,
          drawPrompt: entryMeanings.first,
          answers: entryMeanings,
          answerKind: AnswerKind.meaning,
          modelClass: modelIndex[entry.character],
          strokeAsset: strokeAsset,
        ));
      } else {
        final String label = readingLabel(entry);
        final List<String> answers = readingAnswers(entry);
        if (label.isEmpty || answers.isEmpty) continue;
        items.add(QuizItem(
          symbol: entry.character,
          label: label,
          drawPrompt: entryMeanings.first,
          answers: answers,
          answerKind: AnswerKind.reading,
          modelClass: modelIndex[entry.character],
          strokeAsset: strokeAsset,
        ));
      }
    }
    return items;
  }

  /// "ニチ・ジツ / ひ・か": up to two on'yomi and two kun'yomi.
  static String readingLabel(KanjiEntry entry) {
    final on = entry.readingsOn.map(_cleanReading).where((r) => r.isNotEmpty);
    final kun =
        entry.readingsKun.map(_cleanReading).where((r) => r.isNotEmpty);
    final parts = [
      if (on.isNotEmpty) on.toSet().take(2).join('・'),
      if (kun.isNotEmpty) kun.toSet().take(2).join('・'),
    ];
    return parts.join(' / ');
  }

  /// Every on/kun reading in hiragana, with and without okurigana
  /// (いと.しい → いとしい and いと).
  static List<String> readingAnswers(KanjiEntry entry) {
    final answers = <String>{};
    for (final raw in [...entry.readingsOn, ...entry.readingsKun]) {
      final cleaned = raw.replaceAll('-', '').trim();
      if (cleaned.isEmpty) continue;
      answers.add(KanaConverter.toHiragana(cleaned.replaceAll('.', '')));
      final dot = cleaned.indexOf('.');
      if (dot > 0) {
        answers.add(KanaConverter.toHiragana(cleaned.substring(0, dot)));
      }
    }
    return answers.toList();
  }

  static String _cleanReading(String reading) =>
      reading.replaceAll('-', '').replaceAll('.', '').trim();

  static String _codeFor(String symbol) =>
      symbol.runes.first.toRadixString(16).padLeft(5, '0');

  // ---------------------------------------------------------------------------
  // Answer checking

  static bool checkTypedAnswer(QuizItem item, String typed) {
    switch (item.answerKind) {
      case AnswerKind.romaji:
        final answer = typed.trim().toLowerCase();
        if (answer.isEmpty) return false;
        if (item.answers.contains(answer)) return true;
        // Accept any romanization or kana that spells the same sound.
        final typedKana = KanaConverter.normalizeToHiragana(answer);
        return typedKana != null &&
            typedKana == KanaConverter.toHiragana(item.symbol);
      case AnswerKind.meaning:
        final answer = normalizeMeaning(typed);
        if (answer.isEmpty) return false;
        return item.answers.any((meaning) =>
            normalizeMeaning(meaning) == answer ||
            normalizeMeaning(_stripParenthetical(meaning)) == answer);
      case AnswerKind.reading:
        final typedKana = KanaConverter.normalizeToHiragana(typed);
        return typedKana != null && item.answers.contains(typedKana);
    }
  }

  static const Map<String, String> _diacritics = {
    'á': 'a', 'à': 'a', 'â': 'a', 'ä': 'a', 'ã': 'a',
    'é': 'e', 'è': 'e', 'ê': 'e', 'ë': 'e',
    'í': 'i', 'ì': 'i', 'î': 'i', 'ï': 'i',
    'ó': 'o', 'ò': 'o', 'ô': 'o', 'ö': 'o', 'õ': 'o',
    'ú': 'u', 'ù': 'u', 'û': 'u', 'ü': 'u',
    'ç': 'c', 'ñ': 'n', 'ß': 'ss', 'ё': 'е',
  };

  static String normalizeMeaning(String value) {
    final String lower = value.trim().toLowerCase();
    final buffer = StringBuffer();
    for (final rune in lower.runes) {
      final String char = String.fromCharCode(rune);
      buffer.write(_diacritics[char] ?? char);
    }
    return buffer.toString().replaceAll(RegExp(r'\s+'), ' ');
  }

  static String _stripParenthetical(String value) =>
      value.replaceAll(RegExp(r'[(（][^)）]*[)）]'), '').trim();

  // ---------------------------------------------------------------------------
  // Picking questions

  /// Weight of an item: unseen and weak items come up more, mastered ones
  /// less.
  static double weightFor(ItemStat? stat) {
    if (stat == null || stat.attempts == 0) return 2.0;
    if (stat.mastered) return 0.6;
    // Laplace-smoothed error rate over all attempts, boosted by recent misses.
    final double errorRate = (stat.incorrect + 1) / (stat.attempts + 2);
    final int recentMisses = stat.recent.where((r) => !r).length;
    return 1.0 + 4.0 * errorRate + recentMisses;
  }

  /// Weighted pick that avoids [exclude] (items already asked this session)
  /// and never repeats [previous] when there's an alternative.
  QuizItem pick(
    List<QuizItem> pool, {
    required Map<String, ItemStat> stats,
    Set<QuizItem> exclude = const {},
    QuizItem? previous,
  }) {
    var candidates = pool.where((i) => !exclude.contains(i)).toList();
    if (candidates.isEmpty) candidates = List.of(pool);
    if (candidates.length > 1 && previous != null) {
      candidates.removeWhere((i) => i == previous);
    }
    final weights = [for (final i in candidates) weightFor(stats[i.symbol])];
    final double total = weights.fold(0, (a, b) => a + b);
    double roll = _random.nextDouble() * total;
    for (int i = 0; i < candidates.length; i++) {
      roll -= weights[i];
      if (roll <= 0) return candidates[i];
    }
    return candidates.last;
  }

  /// Four options (or fewer if the pool is small): the correct item plus
  /// distractors from the same pool with distinct labels.
  List<QuizItem> options(QuizItem correct, List<QuizItem> pool) {
    final byLabel = <String, QuizItem>{correct.label: correct};
    final shuffled = List.of(pool)..shuffle(_random);
    for (final item in shuffled) {
      if (byLabel.length >= 4) break;
      if (item.label.isEmpty) continue;
      byLabel.putIfAbsent(item.label, () => item);
    }
    return byLabel.values.toList()..shuffle(_random);
  }
}
