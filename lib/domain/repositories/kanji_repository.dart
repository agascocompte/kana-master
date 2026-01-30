import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/domain/providers/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class KanjiRepository {
  final DatabaseProvider _databaseProvider = DatabaseProvider.dbProvider;

  Future<void> ensureKanjiImported() async {
    final db = await _databaseProvider.database;
    final int count =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM kanji')) ??
            0;
    final int jlptCount = Sqflite.firstIntValue(await db.rawQuery(
          "SELECT COUNT(*) FROM kanji WHERE jlpt IS NOT NULL AND jlpt != ''",
        )) ??
        0;
    if (count > 0 && jlptCount > 0) return;
    if (count > 0 && jlptCount == 0) {
      await db.delete('kanji');
    }

    final String csvData =
        await rootBundle.loadString('assets/csv/kanji_data.csv');
    final List<List<dynamic>> rows =
        const CsvToListConverter(eol: '\n').convert(
      csvData,
      shouldParseNumbers: false,
    );
    if (rows.length <= 1) return;

    final List<String> headers =
        rows.first.map((value) => value.toString().trim()).toList();
    int indexOf(String name) => headers.indexOf(name);

    final int kanjiIndex = indexOf('kanji');
    final int onIndex = indexOf('on_readings');
    final int kunIndex = indexOf('kun_readings');
    final int nameIndex = indexOf('name_readings');
    final int strokeIndex = indexOf('stroke_number');
    final int unicodeIndex = indexOf('unicode');
    final int jlptIndex = indexOf('jlpt');

    if ([kanjiIndex, onIndex, kunIndex, nameIndex, strokeIndex, unicodeIndex]
        .any((index) => index == -1)) {
      return;
    }

    final Batch batch = db.batch();
    for (final row in rows.skip(1)) {
      if (row.length <= unicodeIndex) continue;
      final String character = row[kanjiIndex].toString();
      final String readingsOn = row[onIndex].toString();
      final String readingsKun = row[kunIndex].toString();
      final String readingsName = row[nameIndex].toString();
      final String unicode = _padUnicode(row[unicodeIndex].toString());
      final int strokeCount =
          int.tryParse(row[strokeIndex].toString().trim()) ?? 0;
      final String jlpt =
          jlptIndex == -1 ? '' : row[jlptIndex].toString();

      batch.insert(
        'kanji',
        {
          'unicode': unicode,
          'kanji': character,
          'readings_on': readingsOn,
          'readings_kun': readingsKun,
          'readings_name': readingsName,
          'stroke_count': strokeCount,
          'jlpt': jlpt,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<KanjiEntry>> getAllKanji() async {
    final db = await _databaseProvider.database;
    final List<Map<String, dynamic>> rows = await db.query('kanji');
    return rows
        .map((row) => KanjiEntry.fromCsvRow(
              character: row['kanji']?.toString() ?? '',
              readingsOn: row['readings_on']?.toString() ?? '',
              readingsKun: row['readings_kun']?.toString() ?? '',
              readingsName: row['readings_name']?.toString() ?? '',
              strokeNumber: row['stroke_count']?.toString() ?? '0',
              unicode: row['unicode']?.toString() ?? '',
              jlpt: row['jlpt']?.toString() ?? '',
            ))
        .toList(growable: false);
  }
}

String _padUnicode(String unicode) {
  return unicode.trim().toLowerCase().padLeft(5, '0');
}
