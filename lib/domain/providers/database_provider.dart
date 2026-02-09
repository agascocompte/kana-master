import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/constants.dart';

@lazySingleton
class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider._internal();

  factory DatabaseProvider() => dbProvider;

  DatabaseProvider._internal();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "HiraganaApp.db");
    var database = await openDatabase(
      path,
      version: 5,
      onCreate: initDB,
      onUpgrade: onUpgrade,
    );
    return database;
  }

  Future<void> initDB(Database database, int version) async {
    // Crear la tabla para las respuestas de hiragana
    await database.execute(
      "CREATE TABLE hiragana_responses ("
      "id INTEGER PRIMARY KEY, "
      "timestamp TEXT, "
      "is_correct BOOLEAN"
      ")",
    );

    await database.execute(
      "CREATE TABLE responses ("
      "id INTEGER PRIMARY KEY, "
      "timestamp TEXT, "
      "is_correct BOOLEAN, "
      "kana_type TEXT"
      ")",
    );

    // Crear la tabla para los ajustes
    if (!await tableExists(database, 'settings')) {
      await database.execute(
        "CREATE TABLE settings ("
        "key TEXT PRIMARY KEY, "
        "value TEXT"
        ")",
      );
    }

    if (!await tableExists(database, 'kanji')) {
      await database.execute(
        "CREATE TABLE kanji ("
        "unicode TEXT PRIMARY KEY, "
        "kanji TEXT, "
        "readings_on TEXT, "
        "readings_kun TEXT, "
        "readings_name TEXT, "
        "stroke_count INTEGER"
        ", jlpt TEXT"
        ")",
      );
    }
  }

  Future<void> onUpgrade(
      Database database, int oldVersion, int newVersion) async {
    if (newVersion > oldVersion) {
      if (!await tableExists(database, 'settings')) {
        await database.execute(
          "CREATE TABLE settings ("
          "key TEXT PRIMARY KEY, "
          "value TEXT"
          ")",
        );
      }
      if (oldVersion < 3) {
        await database.execute(
          "CREATE TABLE kanji ("
          "unicode TEXT PRIMARY KEY, "
          "kanji TEXT, "
          "readings_on TEXT, "
          "readings_kun TEXT, "
          "readings_name TEXT, "
          "stroke_count INTEGER"
          ", jlpt TEXT"
          ")",
        );
      }
      if (oldVersion < 4) {
        if (!await columnExists(database, 'kanji', 'readings_name')) {
          await database.execute(
            "ALTER TABLE kanji ADD COLUMN readings_name TEXT",
          );
        }
        if (!await columnExists(database, 'kanji', 'jlpt')) {
          await database.execute(
            "ALTER TABLE kanji ADD COLUMN jlpt TEXT",
          );
        }
      }
      if (oldVersion < 5) {
        await database.execute(
          "CREATE TABLE IF NOT EXISTS responses ("
          "id INTEGER PRIMARY KEY, "
          "timestamp TEXT, "
          "is_correct BOOLEAN, "
          "kana_type TEXT"
          ")",
        );
        if (await tableExists(database, 'hiragana_responses')) {
          final responseCount = Sqflite.firstIntValue(
                await database.rawQuery('SELECT COUNT(*) FROM responses'),
              ) ??
              0;
          if (responseCount == 0) {
            await database.execute(
              "INSERT INTO responses (timestamp, is_correct, kana_type) "
              "SELECT timestamp, is_correct, 'hiragana' FROM hiragana_responses",
            );
          }
        }
      }
    }
  }

  Future<bool> tableExists(Database db, String tableName) async {
    var res = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
      [tableName],
    );
    return res.isNotEmpty;
  }

  Future<bool> columnExists(
    Database db,
    String tableName,
    String columnName,
  ) async {
    final result = await db.rawQuery('PRAGMA table_info($tableName)');
    for (final row in result) {
      if (row['name']?.toString() == columnName) {
        return true;
      }
    }
    return false;
  }

  Future<void> insertResponse({
    required KanaType kanaType,
    required bool isCorrect,
  }) async {
    final db = await database;
    await db.insert(
      'responses',
      {
        'timestamp': DateTime.now().toIso8601String(),
        'is_correct': isCorrect ? 1 : 0,
        'kana_type': kanaType.name,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getResponses({
    KanaType? kanaType,
  }) async {
    final db = await database;
    if (kanaType == null) {
      return await db.query('responses');
    }
    return await db.query(
      'responses',
      where: 'kana_type = ?',
      whereArgs: [kanaType.name],
    );
  }
}
