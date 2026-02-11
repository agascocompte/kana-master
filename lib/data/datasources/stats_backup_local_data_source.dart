import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/models/stats_backup.dart';
import 'package:kana_master/domain/providers/database_provider.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class StatsBackupLocalDataSource {
  final DatabaseProvider databaseProvider;

  StatsBackupLocalDataSource(this.databaseProvider);

  Future<List<StatsBackupResponse>> readAllResponses() async {
    final db = await databaseProvider.database;
    final rows = await db.query(
      'responses',
      orderBy: 'timestamp ASC',
    );
    return rows
        .map((row) => StatsBackupResponse.fromJson(
              Map<String, dynamic>.from(row),
            ))
        .toList();
  }

  Future<void> replaceResponses(List<StatsBackupResponse> responses) async {
    final db = await databaseProvider.database;
    await db.transaction((txn) async {
      await txn.delete('responses');
      for (final response in responses) {
        await txn.insert('responses', {
          'timestamp': response.timestamp,
          'is_correct': response.isCorrect ? 1 : 0,
          'kana_type': response.kanaType,
        }, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    });
  }
}
