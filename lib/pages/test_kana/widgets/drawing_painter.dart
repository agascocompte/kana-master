import 'package:flutter/material.dart';
import 'package:kana_master/domain/models/paint_stroke.dart';
import 'package:kana_master/theme/app_theme.dart';

class DrawingPainter extends CustomPainter {
  final List<PaintStroke> strokes;
  final Paint defaultPaint = Paint()
    ..color = AppColors.teal
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
