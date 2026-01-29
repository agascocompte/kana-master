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
    if (count > 0) return;

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
    final int readingsIndex = indexOf('readings');
    final int strokeIndex = indexOf('stroke_number');
    final int unicodeIndex = indexOf('unicode');

    if ([kanjiIndex, readingsIndex, strokeIndex, unicodeIndex]
        .any((index) => index == -1)) {
      return;
    }

    final Batch batch = db.batch();
    for (final row in rows.skip(1)) {
      if (row.length <= unicodeIndex) continue;
      final String character = row[kanjiIndex].toString();
      final String readingsRaw = row[readingsIndex].toString();
      final Map<String, String> split = _splitReadings(readingsRaw);
      final String unicode = _padUnicode(row[unicodeIndex].toString());
      final int strokeCount =
          int.tryParse(row[strokeIndex].toString().trim()) ?? 0;

      batch.insert(
        'kanji',
        {
          'unicode': unicode,
          'kanji': character,
          'readings_on': split['on'] ?? '',
          'readings_kun': split['kun'] ?? '',
          'stroke_count': strokeCount,
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
              strokeNumber: row['stroke_count']?.toString() ?? '0',
              unicode: row['unicode']?.toString() ?? '',
            ))
        .toList(growable: false);
  }
}

Map<String, String> _splitReadings(String readingsRaw) {
  final List<String> on = [];
  final List<String> kun = [];
  final List<String> parts = readingsRaw
      .split(';')
      .map((reading) => reading.trim())
      .where((reading) => reading.isNotEmpty)
      .toList();
  for (final reading in parts) {
    if (_containsKatakana(reading)) {
      on.add(reading);
    } else if (_containsHiragana(reading)) {
      kun.add(reading);
    } else {
      on.add(reading);
    }
  }
  return {
    'on': on.join(';'),
    'kun': kun.join(';'),
  };
}

bool _containsHiragana(String value) {
  return value.runes.any((code) => code >= 0x3040 && code <= 0x309F);
}

bool _containsKatakana(String value) {
  return value.runes.any((code) => code >= 0x30A0 && code <= 0x30FF);
}

String _padUnicode(String unicode) {
  return unicode.trim().toLowerCase().padLeft(5, '0');
}
