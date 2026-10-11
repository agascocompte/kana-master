import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:kana_master/config/report_config.dart';

/// Sends "the model got my drawing wrong" reports to a Google Apps Script web
/// app (tools/drawing_reports/Code.gs), which emails them and saves them in
/// Google Drive.
class DrawingReportShareService {
  /// Reporting is hidden until lib/config/report_config.dart has the web app
  /// URL.
  static bool get isConfigured => reportWebAppUrl.isNotEmpty;

  Future<void> shareFalseNegativeReport({
    required String script,
    required String expectedLabel,
    required String predictedLabel,
    required double confidence,
    required List<List<Offset>> userStrokes,
    required List<int> pngBytes,
  }) async {
    if (!isConfigured) {
      throw StateError('Drawing reports are not configured.');
    }
    final uri = Uri.parse(reportWebAppUrl)
        .replace(queryParameters: {'token': reportToken});

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

    http.Response response = await http
        .post(
          uri,
          headers: const {'Content-Type': 'application/json'},
          body: jsonEncode(payload),
        )
        .timeout(const Duration(seconds: 20));

    // Apps Script runs the script and then redirects to its output.
    final String? location = response.headers['location'];
    if (response.statusCode == 302 && location != null) {
      response = await http
          .get(Uri.parse(location))
          .timeout(const Duration(seconds: 20));
    }

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw StateError(
        'Report upload failed with status ${response.statusCode}.',
      );
    }
    final dynamic body = jsonDecode(response.body);
    if (body is! Map || body['ok'] != true) {
      throw StateError('Report was rejected: ${response.body}');
    }
  }
}
