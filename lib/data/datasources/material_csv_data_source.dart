import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/models/material_entry.dart';
import 'package:kana_master/domain/models/material_import_result.dart';

@lazySingleton
class MaterialCsvDataSource {
  Future<MaterialImportResult?> pickAndParseCsv() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
      withData: true,
    );
    if (result == null) {
      return null;
    }

    final file = result.files.first;
    final bytes = file.bytes ?? await File(file.path!).readAsBytes();
    final content = utf8.decode(bytes);

    final rows = const CsvToListConverter(eol: '\n').convert(content);
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
