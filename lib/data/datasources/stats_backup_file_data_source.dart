import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StatsBackupFileDataSource {
  Future<String?> pickBackupFileContents() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: false,
    );
    if (result == null || result.files.isEmpty) return null;
    final path = result.files.single.path;
    if (path == null || path.isEmpty) return null;
    return File(path).readAsString();
  }

  Future<String> saveBackupContents(String jsonContent) async {
    final prettyJson =
        const JsonEncoder.withIndent('  ').convert(jsonDecode(jsonContent));
    final fileName = _buildFileName();
    final selectedPath = await FilePicker.platform.saveFile(
      dialogTitle: 'Save stats backup',
      fileName: fileName,
      type: FileType.custom,
      allowedExtensions: ['json'],
      bytes: Uint8List.fromList(utf8.encode(prettyJson)),
    );
    if (selectedPath != null && selectedPath.isNotEmpty) {
      return selectedPath;
    }
    throw Exception('Export cancelled.');
  }

  String _buildFileName() {
    final now = DateTime.now();
    final stamp =
        '${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}';
    return 'kana_master_stats_$stamp.json';
  }
}
