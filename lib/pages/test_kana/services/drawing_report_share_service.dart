import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DrawingReportShareService {
  Future<void> shareFalseNegativeReport({
    required String script,
    required String expectedLabel,
    required String predictedLabel,
    required double confidence,
    required List<List<Offset>> userStrokes,
    required List<int> pngBytes,
  }) async {
    final directory = await getTemporaryDirectory();
    final folder = Directory('${directory.path}/drawing_reports');
    if (!await folder.exists()) {
      await folder.create(recursive: true);
    }

    final now = DateTime.now().toUtc();
    final stamp =
        '${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';
    final pngPath = '${folder.path}/drawing_$stamp.png';
    final jsonPath = '${folder.path}/drawing_$stamp.json';

    await File(pngPath).writeAsBytes(pngBytes);

    final payload = {
      'type': 'false_negative_report',
      'created_at_utc': now.toIso8601String(),
      'script': script,
      'expected_label': expectedLabel,
      'predicted_label': predictedLabel,
      'confidence': confidence,
      'stroke_count': userStrokes.length,
      'strokes': userStrokes
          .map((stroke) => stroke
              .map((point) => {
                    'x': point.dx,
                    'y': point.dy,
                  })
              .toList())
          .toList(),
    };

    await File(jsonPath)
        .writeAsString(const JsonEncoder.withIndent('  ').convert(payload));

    await Share.shareXFiles(
      [
        XFile(pngPath),
        XFile(jsonPath),
      ],
      text:
          'Kana Master drawing report\nExpected: $expectedLabel\nPredicted: $predictedLabel (${(confidence * 100).toStringAsFixed(1)}%)',
      subject: 'Kana Master false negative report',
    );
  }
}
