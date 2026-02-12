import 'package:flutter/material.dart';
import 'package:kana_master/domain/models/paint_stroke.dart';
import 'package:kana_master/theme/app_theme.dart';

class DrawingPainter extends CustomPainter {
  final List<PaintStroke> strokes;
  final double strokeWidth;

  DrawingPainter(
    this.strokes, {
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.teal
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    for (var stroke in strokes) {
      canvas.drawLine(stroke.from, stroke.to, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
