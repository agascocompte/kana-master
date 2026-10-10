import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/models/material_entry.dart';
import 'package:kana_master/domain/models/material_import_result.dart';

@lazySingleton
class MaterialCsvDataSource {
  Future<MaterialImportResult?> pickAndParseCsv() async {
    final file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (file == null) {
      return null;
    }

    var content = utf8.decode(await file.readAsBytes(), allowMalformed: true);
    if (content.startsWith('﻿')) content = content.substring(1);

    // Auto-detects "," or ";" (Excel exports with ";" in many locales).
    final rows = csv.decode(content);
    if (rows.isEmpty || rows.first.isEmpty) {
      throw Exception('Data not found in CSV.');
    }

    final headers = rows.first
        .map((e) => e.toString().trim())
        .where((h) => h.isNotEmpty)
        .toList();
    final entries = rows
        .skip(1)
        .map((row) => MaterialEntry.fromRow(headers, row))
        .where((entry) => entry.hasAnyValue)
        .toList();

    if (entries.isEmpty) {
      throw Exception('No valid rows found.');
    }

    return MaterialImportResult(
      headers: headers,
      entries: entries,
      fileName: file.name,
    );
  }
}
