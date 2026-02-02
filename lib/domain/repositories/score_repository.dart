import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/stats_summary.dart';
import 'package:kana_master/domain/providers/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class ScoreRepository {
  final DatabaseProvider _databaseProvider = DatabaseProvider.dbProvider;

  Future<void> addResponse({
    required KanaType kanaType,
    required bool isCorrect,
  }) async {
    await _databaseProvider.insertResponse(
      kanaType: kanaType,
      isCorrect: isCorrect,
    );
  }

  Future<int> getCorrectCount(KanaType kanaType) async {
    final db = await _databaseProvider.database;
    return Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM responses WHERE is_correct = 1 AND kana_type = ?',
          [kanaType.name],
        )) ??
        0;
  }

  Future<int> getIncorrectCount(KanaType kanaType) async {
    final db = await _databaseProvider.database;
    return Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM responses WHERE is_correct = 0 AND kana_type = ?',
          [kanaType.name],
        )) ??
        0;
  }

  Future<void> resetCounts() async {
    final db = await _databaseProvider.database;
    await db.delete('responses');
  }

  Future<Map<DateTime, int>> getCorrectCountsByDate(KanaType kanaType) async {
    final db = await _databaseProvider.database;
    final List<Map<String, dynamic>> result = await db.rawQuery(
      '''
    SELECT
      strftime('%Y-%m-%d', timestamp) as date,
      count(*) as count
    FROM
      responses
    WHERE
      is_correct = 1 AND kana_type = ?
    GROUP BY
      date
    ORDER BY
      date ASC
  ''',
      [kanaType.name],
    );

    Map<DateTime, int> correctCountsByDate = {};
    for (final row in result) {
      DateTime date = DateTime.parse(row['date']);
      correctCountsByDate[date] = row['count'];
    }
    return correctCountsByDate;
  }

  Future<Map<DateTime, int>> getIncorrectCountsByDate(KanaType kanaType) async {
    final db = await _databaseProvider.database;
    final List<Map<String, dynamic>> result = await db.rawQuery(
      '''
    SELECT
      strftime('%Y-%m-%d', timestamp) as date,
      count(*) as count
    FROM
      responses
    WHERE
      is_correct = 0 AND kana_type = ?
    GROUP BY
      date
    ORDER BY
      date ASC
  ''',
      [kanaType.name],
    );

    Map<DateTime, int> incorrectCountsByDate = {};
    for (final row in result) {
      DateTime date = DateTime.parse(row['date']);
      incorrectCountsByDate[date] = row['count'];
    }
    return incorrectCountsByDate;
  }

  Future<List<DateTime>> getActiveDates(KanaType kanaType) async {
    final db = await _databaseProvider.database;
    final List<Map<String, dynamic>> rows = await db.rawQuery(
      '''
      SELECT DISTINCT strftime('%Y-%m-%d', timestamp) as date
      FROM responses
      WHERE kana_type = ?
      ORDER BY date ASC
      ''',
      [kanaType.name],
    );
    return rows
        .map((row) => DateTime.parse(row['date']))
        .toList(growable: false);
  }

  Future<int> getTotalCountSince(
    KanaType kanaType,
    DateTime since,
  ) async {
    final db = await _databaseProvider.database;
    return Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM responses WHERE kana_type = ? AND timestamp >= ?',
          [kanaType.name, since.toIso8601String()],
        )) ??
        0;
  }

  Future<StatsSummary> getSummary(KanaType kanaType) async {
    final correct = await getCorrectCount(kanaType);
    final incorrect = await getIncorrectCount(kanaType);
    final total = correct + incorrect;
    final accuracy = total == 0 ? 0.0 : correct / total;
    final activeDates = await getActiveDates(kanaType);
    final streaks = _computeStreaks(activeDates);
    final now = DateTime.now();
    final last7Days = await getTotalCountSince(
        kanaType, now.subtract(const Duration(days: 6)));
    final last30Days = await getTotalCountSince(
        kanaType, now.subtract(const Duration(days: 29)));
    return StatsSummary(
      correct: correct,
      incorrect: incorrect,
      total: total,
      accuracy: accuracy,
      currentStreak: streaks.currentStreak,
      bestStreak: streaks.bestStreak,
      last7DaysCount: last7Days,
      last30DaysCount: last30Days,
      lastActiveDate: streaks.lastActiveDate,
    );
  }
}

class _StreakResult {
  final int currentStreak;
  final int bestStreak;
  final DateTime? lastActiveDate;

  _StreakResult({
    required this.currentStreak,
    required this.bestStreak,
    required this.lastActiveDate,
  });
}

_StreakResult _computeStreaks(List<DateTime> dates) {
  if (dates.isEmpty) {
    return _StreakResult(
      currentStreak: 0,
      bestStreak: 0,
      lastActiveDate: null,
    );
  }
  final sorted = dates.toList()..sort((a, b) => a.compareTo(b));
  int best = 1;
  int current = 1;
  for (int i = 1; i < sorted.length; i++) {
    final diff = sorted[i].difference(sorted[i - 1]).inDays;
    if (diff == 1) {
      current += 1;
      if (current > best) best = current;
    } else if (diff > 1) {
      current = 1;
    }
  }
  final DateTime lastDate = sorted.last;
  int currentStreak = 1;
  for (int i = sorted.length - 1; i > 0; i--) {
    final diff = sorted[i].difference(sorted[i - 1]).inDays;
    if (diff == 1) {
      currentStreak += 1;
    } else {
      break;
    }
  }
  return _StreakResult(
    currentStreak: currentStreak,
    bestStreak: best,
    lastActiveDate: lastDate,
  );
}
