import 'package:kana_master/domain/exam/exam_models.dart';

class Tally {
  final int correct;
  final int total;

  const Tally(this.correct, this.total);

  double get ratio => total == 0 ? 0 : correct / total;

  Tally operator +(Tally other) =>
      Tally(correct + other.correct, total + other.total);

  Map<String, int> toJson() => {'c': correct, 't': total};

  factory Tally.fromJson(Map<String, dynamic> json) =>
      Tally(json['c'] as int, json['t'] as int);
}

/// Official N5 scale: vocabulary, grammar and reading score together out of
/// 120 and listening out of 60. A pass needs 80 of 180 overall and at least
/// 38 and 19 in each scoring section.
///
/// The JLPT uses equated scaled scores whose item weights are not
/// published; here every item weighs the same, which gives an estimate.
class ExamScore {
  static const int languageMax = 120;
  static const int listeningMax = 60;
  static const int totalMax = 180;
  static const int passTotal = 80;
  static const int passLanguage = 38;
  static const int passListening = 19;

  final Map<Mondai, Tally> byMondai;

  const ExamScore(this.byMondai);

  factory ExamScore.grade(
    List<ExamQuestion> questions,
    Map<ExamQuestion, int> answers,
  ) {
    final byMondai = <Mondai, Tally>{};
    for (final q in questions) {
      final right = answers[q] == q.correctIndex ? 1 : 0;
      byMondai[q.mondai] =
          (byMondai[q.mondai] ?? const Tally(0, 0)) + Tally(right, 1);
    }
    return ExamScore(byMondai);
  }

  Tally area(ScoreArea area) => byMondai.entries
      .where((e) => e.key.area == area)
      .fold(const Tally(0, 0), (sum, e) => sum + e.value);

  Tally section(ExamSection section) => byMondai.entries
      .where((e) => e.key.section == section)
      .fold(const Tally(0, 0), (sum, e) => sum + e.value);

  Tally get language =>
      area(ScoreArea.vocabulary) +
      area(ScoreArea.grammar) +
      area(ScoreArea.reading);

  Tally get listening => area(ScoreArea.listening);

  Tally get overall => language + listening;

  bool get hasLanguage => language.total > 0;
  bool get hasListening => listening.total > 0;
  bool get isFull =>
      hasListening &&
      section(ExamSection.vocabulary).total > 0 &&
      section(ExamSection.grammarReading).total > 0;

  int get languagePoints => (language.ratio * languageMax).round();
  int get listeningPoints => (listening.ratio * listeningMax).round();
  int get totalPoints => languagePoints + listeningPoints;

  bool get languagePassed => languagePoints >= passLanguage;
  bool get listeningPassed => listeningPoints >= passListening;
  bool get passed =>
      totalPoints >= passTotal && languagePassed && listeningPassed;

  Map<String, dynamic> toJson() =>
      {for (final e in byMondai.entries) e.key.name: e.value.toJson()};

  factory ExamScore.fromJson(Map<String, dynamic> json) {
    return ExamScore({
      for (final e in json.entries)
        Mondai.values.byName(e.key):
            Tally.fromJson(e.value as Map<String, dynamic>),
    });
  }
}
