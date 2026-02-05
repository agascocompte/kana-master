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

  Future<void> saveLanguageCode(String languageCode) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'language_code', 'value': languageCode},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String> getLanguageCode() async {
    final db = await _databaseProvider.database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['language_code'],
    );
    if (result.isNotEmpty) {
      return result.first['value']?.toString() ?? 'es';
    }
    return 'es';
  }

  Future<void> saveHapticsEnabled(bool enabled) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'haptics_enabled', 'value': enabled ? '1' : '0'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> getHapticsEnabled() async {
    final db = await _databaseProvider.database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['haptics_enabled'],
    );
    if (result.isNotEmpty) {
      return result.first['value']?.toString() == '1';
    }
    return true;
  }

  Future<void> saveKanaScale(double scale) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'kana_scale', 'value': scale.toString()},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<double> getKanaScale() async {
    final db = await _databaseProvider.database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['kana_scale'],
    );
    if (result.isNotEmpty) {
      return double.tryParse(result.first['value']?.toString() ?? '') ?? 1.0;
    }
    return 1.0;
  }

  Future<void> saveKanjiJlptFilter(String filter) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'kanji_jlpt_filter', 'value': filter},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String> getKanjiJlptFilter() async {
    final db = await _databaseProvider.database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['kanji_jlpt_filter'],
    );
    if (result.isNotEmpty) {
      return result.first['value']?.toString() ?? 'all';
    }
    return 'all';
  }
}
