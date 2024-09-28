import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/domain/models/paint_stroke.dart';

class DrawingPainter extends CustomPainter {
  final List<PaintStroke> strokes;
  final Paint defaultPaint = Paint()
    ..color = jLightBLue
    ..strokeWidth = 20.0
    ..strokeCap = StrokeCap.round;

  DrawingPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    for (var stroke in strokes) {
      canvas.drawLine(stroke.from, stroke.to, defaultPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
