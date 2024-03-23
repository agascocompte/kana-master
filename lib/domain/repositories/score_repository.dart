import 'package:hiragana_japanesse/domain/providers/database_provider.dart';

class ScoreRepository {
  final DatabaseProvider _databaseProvider = DatabaseProvider.dbProvider;

  Future<int> getCorrectHiraganaCount() async {
    List<Map<String, dynamic>> responses =
        await _databaseProvider.getResponses();
    return responses.where((response) => response['is_correct'] == 1).length;
  }

  Future<int> getIncorrectHiraganaCount() async {
    List<Map<String, dynamic>> responses =
        await _databaseProvider.getResponses();
    return responses.where((response) => response['is_correct'] == 0).length;
  }

  Future<void> incrementCorrectHiraganaCount() async {
    await _databaseProvider.insertResponse(true);
  }

  Future<void> incrementIncorrectHiraganaCount() async {
    await _databaseProvider.insertResponse(false);
  }

  Future<void> resetHiraganaCounts() async {
    final db = await _databaseProvider.database;
    await db.delete('hiragana_responses');
  }

  Future<Map<DateTime, int>> getCorrectHiraganaCountsByDate() async {
    final db = await _databaseProvider.database;
    List<Map<String, dynamic>> result = await db.rawQuery(
      '''
    SELECT
      strftime('%Y-%m-%d', timestamp) as date,
      count(*) as count
    FROM
      hiragana_responses
    WHERE
      is_correct = 1
    GROUP BY
      date
    ORDER BY
      date ASC
  ''',
    );

    Map<DateTime, int> correctCountsByDate = {};
    for (var row in result) {
      DateTime date = DateTime.parse(row['date']);
      correctCountsByDate[date] = row['count'];
    }
    return correctCountsByDate;
  }

  Future<Map<DateTime, int>> getIncorrectHiraganaCountsByDate() async {
    final db = await _databaseProvider.database;
    List<Map<String, dynamic>> result = await db.rawQuery(
      '''
    SELECT
      strftime('%Y-%m-%d', timestamp) as date,
      count(*) as count
    FROM
      hiragana_responses
    WHERE
      is_correct = 0
    GROUP BY
      date
    ORDER BY
      date ASC
  ''',
    );

    Map<DateTime, int> incorrectCountsByDate = {};
    for (var row in result) {
      DateTime date = DateTime.parse(row['date']);
      incorrectCountsByDate[date] = row['count'];
    }
    return incorrectCountsByDate;
  }
}
