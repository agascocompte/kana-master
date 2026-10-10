import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StatsBackupFileDataSource {
  Future<String?> pickBackupFileContents() async {
    final file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (file == null) return null;
    return utf8.decode(await file.readAsBytes());
  }

  Future<String> saveBackupContents(String jsonContent) async {
    final prettyJson =
        const JsonEncoder.withIndent('  ').convert(jsonDecode(jsonContent));
    final fileName = _buildFileName();
    final savedUri = await FilePicker.saveFile(
      dialogTitle: 'Save stats backup',
      fileName: fileName,
      mimeType: 'application/json',
      type: FileType.custom,
      allowedExtensions: ['json'],
      bytes: Uint8List.fromList(utf8.encode(prettyJson)),
    );
    if (savedUri == null) {
      throw Exception('Export cancelled.');
    }
    return savedUri.scheme == 'file'
        ? savedUri.toFilePath()
        : savedUri.pathSegments.isNotEmpty
            ? Uri.decodeComponent(savedUri.pathSegments.last)
            : fileName;
  }

  String _buildFileName() {
    final now = DateTime.now();
    final stamp =
        '${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}';
    return 'kana_master_stats_$stamp.json';
  }
}
