import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kana_master/domain/exam/exam_bank.dart';
import 'package:kana_master/domain/exam/exam_builder.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/domain/exam/exam_scoring.dart';
import 'package:kana_master/domain/providers/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class ExamResultRecord {
  final int id;
  final DateTime timestamp;
  final List<ExamSection> sections;
  final ExamScore score;

  const ExamResultRecord({
    required this.id,
    required this.timestamp,
    required this.sections,
    required this.score,
  });

  bool get isFull => sections.length == ExamSection.values.length;
}

class ExamRepository {
  final DatabaseProvider _databaseProvider = DatabaseProvider.dbProvider;
  ExamBank? _bank;

  Future<ExamBank> loadBank() async {
    if (_bank != null) return _bank!;
    final sources = await Future.wait(
      Mondai.values.map((m) => rootBundle.loadString(examBankAsset(m))),
    );
    return _bank = ExamBank.fromJsonStrings({
      for (var i = 0; i < Mondai.values.length; i++)
        Mondai.values[i]: sources[i],
    });
  }

  Future<ExamPaper> createPaper(List<ExamSection> sections) async {
    final builder = ExamBuilder(
      bank: await loadBank(),
      history: await getItemHistory(),
    );
    return builder.build(sections);
  }

  Future<Map<String, ItemHistory>> getItemHistory() async {
    final db = await _databaseProvider.database;
    final rows = await db.query('exam_items');
    return {
      for (final row in rows)
        row['item_id'] as String: ItemHistory(
          seen: row['seen'] as int? ?? 0,
          lastSeen: DateTime.tryParse(row['last_seen'] as String? ?? ''),
          lastCorrect: row['last_correct'] == 1,
        ),
    };
  }

  /// Saves the score and marks every bank item of the test as seen. Items
  /// with several questions count as right only when all of them are.
  Future<void> saveResult(
    ExamPaper paper,
    Map<ExamQuestion, int> answers,
    ExamScore score,
  ) async {
    final db = await _databaseProvider.database;
    final now = DateTime.now().toIso8601String();
    final itemCorrect = <String, bool>{};
    for (final q in paper.allQuestions) {
      final id = q.itemId.split('#').first;
      final right = answers[q] == q.correctIndex;
      itemCorrect[id] = (itemCorrect[id] ?? true) && right;
    }
    await db.transaction((txn) async {
      await txn.insert('exam_results', {
        'timestamp': now,
        'sections': paper.sections.map((s) => s.name).join(','),
        'score': json.encode(score.toJson()),
      });
      for (final entry in itemCorrect.entries) {
        final updated = await txn.rawUpdate(
          'UPDATE exam_items SET seen = seen + 1, last_seen = ?, '
          'last_correct = ? WHERE item_id = ?',
          [now, entry.value ? 1 : 0, entry.key],
        );
        if (updated == 0) {
          await txn.insert('exam_items', {
            'item_id': entry.key,
            'seen': 1,
            'last_seen': now,
            'last_correct': entry.value ? 1 : 0,
          });
        }
      }
    });
  }

  Future<List<ExamResultRecord>> getResults() async {
    final db = await _databaseProvider.database;
    final rows = await db.query('exam_results', orderBy: 'timestamp DESC');
    return [
      for (final row in rows)
        ExamResultRecord(
          id: row['id'] as int,
          timestamp: DateTime.parse(row['timestamp'] as String),
          sections: (row['sections'] as String)
              .split(',')
              .map(ExamSection.values.byName)
              .toList(),
          score: ExamScore.fromJson(
            json.decode(row['score'] as String) as Map<String, dynamic>,
          ),
        ),
    ];
  }

  /// Bank items already used at least once, and the bank size.
  Future<(int, int)> getCoverage() async {
    final db = await _databaseProvider.database;
    final seen = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM exam_items'),
        ) ??
        0;
    final bank = await loadBank();
    return (seen, bank.size);
  }
}
