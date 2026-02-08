import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/stroke_number.dart';

class StrokeOrderPainter extends CustomPainter {
  final List<Path> paths;
  final List<StrokeNumber> numbers;
  final Size viewBox;
  final double progress;
  final Duration perStrokeDuration;
  final Duration interStrokeDelay;

  StrokeOrderPainter({
    required this.paths,
    required this.numbers,
    required this.viewBox,
    required this.progress,
    required this.perStrokeDuration,
    required this.interStrokeDelay,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double scale = math.min(
      size.width / viewBox.width,
      size.height / viewBox.height,
    );
    final double dx = (size.width - viewBox.width * scale) / 2;
    final double dy = (size.height - viewBox.height * scale) / 2;

    canvas.save();
    canvas.translate(dx, dy);
    canvas.scale(scale);

    final List<Color> strokePalette = [
      jLightBLue,
      jOrange,
      const Color(0xFF2E7D32),
      const Color(0xFF6D4C41),
      const Color(0xFFD81B60),
      const Color(0xFF0277BD),
      const Color(0xFFF9A825),
      const Color(0xFF8E24AA),
    ];
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final int total = paths.length;
    final double perStrokeMs = perStrokeDuration.inMilliseconds.toDouble();
    final double delayMs = interStrokeDelay.inMilliseconds.toDouble();
    final double segmentMs = perStrokeMs + delayMs;
    final double elapsedMs = progress * segmentMs * total;
    final int current = (elapsedMs / segmentMs).floor().clamp(0, total - 1);
    final double segmentProgress = elapsedMs - (current * segmentMs);
    final bool inDrawPhase = segmentProgress <= perStrokeMs || delayMs == 0;
    final double currentProgress = perStrokeMs == 0
        ? 1.0
        : (segmentProgress / perStrokeMs).clamp(0.0, 1.0);

    for (int i = 0; i < total; i++) {
      final Color color = strokePalette[i % strokePalette.length];
      if (i < current) {
        paint
          ..color = color
          ..strokeWidth = 4.0;
        canvas.drawPath(paths[i], paint);
      } else if (i == current) {
        paint
          ..color = color
          ..strokeWidth = 5.0;
        if (inDrawPhase) {
          _drawPartialPath(canvas, paths[i], currentProgress, paint);
        } else {
          canvas.drawPath(paths[i], paint);
        }
      }
    }
    _drawNumbers(canvas, current, strokePalette);
    canvas.restore();
  }

  void _drawNumbers(
    Canvas canvas,
    int currentStroke,
    List<Color> strokePalette,
  ) {
    if (numbers.isEmpty) return;
    final List<StrokeNumber> ordered = List.from(numbers)
      ..sort((a, b) => a.number.compareTo(b.number));
    for (int i = 0; i < ordered.length; i++) {
      if (i > currentStroke) break;
      final Color color = strokePalette[i % strokePalette.length];
      final TextStyle style = TextStyle(
        color: color,
        fontSize: 8,
        fontWeight: FontWeight.w600,
      );
      final textPainter = TextPainter(
        text: TextSpan(text: ordered[i].number.toString(), style: style),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(ordered[i].position.dx, ordered[i].position.dy) -
            const Offset(2, 6),
      );
    }
  }

  void _drawPartialPath(
    Canvas canvas,
    Path path,
    double progress,
    Paint paint,
  ) {
    for (final metric in path.computeMetrics()) {
      final double length = metric.length * progress.clamp(0.0, 1.0);
      final Path extract = metric.extractPath(0, length);
      canvas.drawPath(extract, paint);
    }
  }

  @override
  bool shouldRepaint(covariant StrokeOrderPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.paths != paths ||
        oldDelegate.numbers != numbers ||
        oldDelegate.viewBox != viewBox ||
        oldDelegate.perStrokeDuration != perStrokeDuration ||
        oldDelegate.interStrokeDelay != interStrokeDelay;
  }
}
