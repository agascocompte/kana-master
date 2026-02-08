class StatsSummary {
  final int correct;
  final int incorrect;
  final int total;
  final double accuracy;
  final int currentStreak;
  final int bestStreak;
  final int last7DaysCount;
  final int last30DaysCount;
  final DateTime? lastActiveDate;

  StatsSummary({
    required this.correct,
    required this.incorrect,
    required this.total,
    required this.accuracy,
    required this.currentStreak,
    required this.bestStreak,
    required this.last7DaysCount,
    required this.last30DaysCount,
    required this.lastActiveDate,
  });

  factory StatsSummary.zero() => StatsSummary(
        correct: 0,
        incorrect: 0,
        total: 0,
        accuracy: 0,
        currentStreak: 0,
        bestStreak: 0,
        last7DaysCount: 0,
        last30DaysCount: 0,
        lastActiveDate: null,
      );
}
