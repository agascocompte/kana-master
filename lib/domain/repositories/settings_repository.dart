import 'package:kana_master/domain/providers/database_provider.dart';
import 'package:kana_master/constants.dart';
import 'package:sqflite/sqflite.dart';

class SettingsRepository {
  final DatabaseProvider _databaseProvider = DatabaseProvider.dbProvider;

  Future<void> saveKanaType(KanaType kanaType) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'kana_type', 'value': kanaType.index.toString()},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<KanaType> getKanaType() async {
    final db = await _databaseProvider.database;
    List<Map<String, dynamic>> result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['kana_type'],
    );
    if (result.isNotEmpty) {
      int kanaTypeIndex = int.parse(result.first['value']);
      return KanaType.values[kanaTypeIndex];
    } else {
      return KanaType.hiragana; // valor por defecto
    }
  }

  Future<void> saveDifficultyLevel(DifficultyLevel difficultyLevel) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'difficulty_level', 'value': difficultyLevel.index.toString()},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<DifficultyLevel> getDifficultyLevel() async {
    final db = await _databaseProvider.database;
    List<Map<String, dynamic>> result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['difficulty_level'],
    );
    if (result.isNotEmpty) {
      int difficultyLevelIndex = int.parse(result.first['value']);
      return DifficultyLevel.values[difficultyLevelIndex];
    } else {
      return DifficultyLevel.low; // valor por defecto
    }
  }
}
