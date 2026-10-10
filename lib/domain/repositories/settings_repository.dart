import 'dart:ui';

import 'package:kana_master/domain/providers/database_provider.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
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
    final String? saved = result.isNotEmpty
        ? result.first['value']?.toString()
        : null;
    if (saved != null && languages.containsKey(saved)) {
      return saved;
    }
    return _deviceLanguageCode();
  }

  /// Device language if the app supports it, otherwise English.
  String _deviceLanguageCode() {
    for (final locale in PlatformDispatcher.instance.locales) {
      if (languages.containsKey(locale.languageCode)) {
        return locale.languageCode;
      }
    }
    return 'en';
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
      return result.first['value']?.toString() ?? 'n5';
    }
    return 'n5';
  }

  Future<void> saveUseModelHiragana(bool enabled) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'use_model_hiragana', 'value': enabled ? '1' : '0'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> getUseModelHiragana() async {
    final db = await _databaseProvider.database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['use_model_hiragana'],
    );
    if (result.isNotEmpty) {
      return result.first['value']?.toString() == '1';
    }
    return true;
  }

  Future<void> saveUseModelKatakana(bool enabled) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'use_model_katakana', 'value': enabled ? '1' : '0'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> getUseModelKatakana() async {
    final db = await _databaseProvider.database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['use_model_katakana'],
    );
    if (result.isNotEmpty) {
      return result.first['value']?.toString() == '1';
    }
    return true;
  }

  Future<void> saveUseModelKanji(bool enabled) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'use_model_kanji', 'value': enabled ? '1' : '0'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> getUseModelKanji() async {
    final db = await _databaseProvider.database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['use_model_kanji'],
    );
    if (result.isNotEmpty) {
      return result.first['value']?.toString() == '1';
    }
    return false;
  }

  Future<String?> _getValue(String key) async {
    final db = await _databaseProvider.database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: [key],
    );
    return result.isNotEmpty ? result.first['value']?.toString() : null;
  }

  Future<void> _setValue(String key, String value) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': key, 'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Kana groups selected for practice, or null if never chosen.
  Future<Set<String>?> getKanaGroups(KanaType kanaType) async {
    final value = await _getValue('kana_groups_${kanaType.name}');
    if (value == null) return null;
    return value.split(',').where((id) => id.isNotEmpty).toSet();
  }

  Future<void> saveKanaGroups(KanaType kanaType, Set<String> groupIds) =>
      _setValue('kana_groups_${kanaType.name}', groupIds.join(','));

  Future<KanjiQuizMode> getKanjiQuizMode() async {
    final value = await _getValue('kanji_quiz_mode');
    return KanjiQuizMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => KanjiQuizMode.meaning,
    );
  }

  Future<void> saveKanjiQuizMode(KanjiQuizMode mode) =>
      _setValue('kanji_quiz_mode', mode.name);

  Future<int> getSessionLength() async {
    final value = int.tryParse(await _getValue('session_length') ?? '');
    return sessionLengths.contains(value) ? value! : defaultSessionLength;
  }

  Future<void> saveSessionLength(int length) =>
      _setValue('session_length', length.toString());

  /// Imported materials (headers, rows and chosen columns) as JSON.
  Future<String?> getMaterialsJson() => _getValue('materials_json');

  Future<void> saveMaterialsJson(String json) =>
      _setValue('materials_json', json);

  Future<void> savePremiumUnlocked(bool unlocked) async {
    final db = await _databaseProvider.database;
    await db.insert(
      'settings',
      {'key': 'premium_unlocked', 'value': unlocked ? '1' : '0'},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> getPremiumUnlocked() async {
    final db = await _databaseProvider.database;
    final result = await db.query(
      'settings',
      where: 'key = ?',
      whereArgs: ['premium_unlocked'],
    );
    if (result.isNotEmpty) {
      return result.first['value']?.toString() == '1';
    }
    return false;
  }
}
