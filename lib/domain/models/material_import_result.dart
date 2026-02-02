import 'package:kana_master/domain/models/material_entry.dart';

class MaterialImportResult {
  final List<String> headers;
  final List<MaterialEntry> entries;
  final String fileName;

  MaterialImportResult({
    required this.headers,
    required this.entries,
    required this.fileName,
  });
}
