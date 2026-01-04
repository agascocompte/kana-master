import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/paint_stroke.dart';

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
