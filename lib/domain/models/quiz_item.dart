/// One question of a practice session.
class QuizItem {
  /// Character shown or asked for (あ, きゃ, 愛). Also the key for per-item
  /// statistics.
  final String symbol;

  /// Correct answer as shown in single choice and when revealing a mistake
  /// (romaji, meaning or readings).
  final String label;

  /// Prompt used in drawing tests (romaji or meaning).
  final String drawPrompt;

  /// Class index in the drawing model, or null when the model can't
  /// recognise it.
  final int? modelClass;

  /// Stroke-order SVG, or null when the item has no stroke data (and so
  /// can't be used in drawing tests).
  final String? strokeAsset;

  /// Every answer accepted when typing.
  final List<String> answers;

  final AnswerKind answerKind;

  const QuizItem({
    required this.symbol,
    required this.label,
    required this.drawPrompt,
    required this.answers,
    required this.answerKind,
    this.modelClass,
    this.strokeAsset,
  });

  bool get drawable => strokeAsset != null;

  @override
  bool operator ==(Object other) =>
      other is QuizItem && other.symbol == symbol && other.label == label;

  @override
  int get hashCode => Object.hash(symbol, label);
}

enum KanjiQuizMode { meaning, reading }

/// How typed answers are compared: romaji of a kana, meaning of a kanji, or
/// reading of a kanji (typed in kana or romaji).
enum AnswerKind { romaji, meaning, reading }

/// Answer history of one character, used to weight questions and to show
/// mastery.
class ItemStat {
  final int correct;
  final int incorrect;

  /// Most recent results, oldest first (at most [recentWindow]).
  final List<bool> recent;

  static const int recentWindow = 5;

  const ItemStat({
    this.correct = 0,
    this.incorrect = 0,
    this.recent = const [],
  });

  int get attempts => correct + incorrect;

  /// Three correct answers in a row.
  bool get mastered =>
      recent.length >= 3 && recent.sublist(recent.length - 3).every((r) => r);

  /// Has mistakes and isn't mastered yet.
  bool get weak => incorrect > 0 && !mastered;

  ItemStat record(bool isCorrect) {
    final updated = [...recent, isCorrect];
    return ItemStat(
      correct: correct + (isCorrect ? 1 : 0),
      incorrect: incorrect + (isCorrect ? 0 : 1),
      recent: updated.length > recentWindow
          ? updated.sublist(updated.length - recentWindow)
          : updated,
    );
  }
}
