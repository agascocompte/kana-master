import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;

class DrawingReportShareService {
  static const String _endpoint =
      "http://13.60.216.164:8081/drawing-report?token=6GyDzXxhMQOJIGSbcziZPR0MRQiGeTWlVvxCaprH80kTDbi09IwT0FwhUYxEYtw2";
  //String.fromEnvironment('DRAWING_REPORT_ENDPOINT');

  Future<void> shareFalseNegativeReport({
    required String script,
    required String expectedLabel,
    required String predictedLabel,
    required double confidence,
    required List<List<Offset>> userStrokes,
    required List<int> pngBytes,
  }) async {
    if (_endpoint.isEmpty) {
      throw StateError('DRAWING_REPORT_ENDPOINT is not configured.');
    }

    final uri = Uri.tryParse(_endpoint);
    if (uri == null) {
      throw StateError('Invalid DRAWING_REPORT_ENDPOINT URL.');
    }

    final now = DateTime.now().toUtc();
    final payload = {
      'type': 'false_negative_report',
      'created_at_utc': now.toIso8601String(),
      'script': script,
      'expected_label': expectedLabel,
      'predicted_label': predictedLabel,
      'confidence': confidence,
      'stroke_count': userStrokes.length,
      'drawing_png_base64': base64Encode(pngBytes),
      'strokes': userStrokes
          .map((stroke) => stroke
              .map((point) => {
                    'x': point.dx,
                    'y': point.dy,
                  })
              .toList())
          .toList(),
    };

    final response = await http
        .post(
          uri,
          headers: const {'Content-Type': 'application/json'},
          body: jsonEncode(payload),
        )
        .timeout(const Duration(seconds: 12));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw StateError(
        'Report upload failed with status ${response.statusCode}.',
      );
    }
  }
}
