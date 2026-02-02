import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

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
      version: 4,
      onCreate: initDB,
      onUpgrade: onUpgrade,
    );
    return database;
  }

  void initDB(Database database, int version) async {
    // Crear la tabla para las respuestas de hiragana
    await database.execute(
      "CREATE TABLE hiragana_responses ("
      "id INTEGER PRIMARY KEY, "
      "timestamp TEXT, "
      "is_correct BOOLEAN"
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

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {
      // Si la versión es anterior a 2, crear la tabla `settings`
      database.execute(
        "CREATE TABLE settings ("
        "key TEXT PRIMARY KEY, "
        "value TEXT"
        ")",
      );
      if (oldVersion < 3) {
        database.execute(
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
        database.execute(
          "ALTER TABLE kanji ADD COLUMN readings_name TEXT",
        );
        database.execute(
          "ALTER TABLE kanji ADD COLUMN jlpt TEXT",
        );
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

  Future<void> insertResponse(bool isCorrect) async {
    final db = await database;
    await db.insert(
      'hiragana_responses',
      {
        'timestamp': DateTime.now().toIso8601String(),
        'is_correct': isCorrect ? 1 : 0,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getResponses() async {
    final db = await database;
    return await db.query('hiragana_responses');
  }
}
