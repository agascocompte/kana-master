import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kana_master/constants.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:xml/xml.dart';

class KanaStrokeAnimation extends StatefulWidget {
  final String assetPath;
  final Duration perStrokeDuration;
  final Duration interStrokeDelay;
  final Duration pauseDuration;

  const KanaStrokeAnimation({
    super.key,
    required this.assetPath,
    this.perStrokeDuration = const Duration(milliseconds: 900),
    this.interStrokeDelay = const Duration(milliseconds: 250),
    this.pauseDuration = const Duration(milliseconds: 2300),
  });

  @override
  State<KanaStrokeAnimation> createState() => _KanaStrokeAnimationState();
}

class _KanaStrokeAnimationState extends State<KanaStrokeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  _StrokeData? _strokeData;
  bool _loadFailed = false;
  int _animationToken = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant KanaStrokeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath) {
      _controller?.dispose();
      _controller = null;
      _strokeData = null;
      _loadFailed = false;
      _animationToken++;
      _load();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final data = await _loadStrokeData(widget.assetPath);
      if (!mounted) return;
      if (data.paths.isEmpty) {
        setState(() {
          _strokeData = data;
          _loadFailed = false;
        });
        return;
      }
      _controller = AnimationController(
        vsync: this,
        duration: (widget.perStrokeDuration + widget.interStrokeDelay) *
            data.paths.length,
      );
      setState(() {
        _strokeData = data;
        _loadFailed = false;
      });
      _startAnimationLoop(++_animationToken);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _strokeData = const _StrokeData(
          paths: [],
          numbers: [],
          viewBox: Size(109, 109),
        );
        _loadFailed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_strokeData == null) {
      return const SizedBox(height: 180);
    }
    if (_loadFailed) {
      return const SizedBox(height: 180);
    }
    if (_strokeData!.paths.isEmpty || _controller == null) {
      return SvgPicture.asset(
        widget.assetPath,
        fit: BoxFit.contain,
      );
    }
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return SizedBox(
          height: 180,
          width: double.infinity,
          child: CustomPaint(
            painter: _StrokeOrderPainter(
              paths: _strokeData!.paths,
              numbers: _strokeData!.numbers,
              viewBox: _strokeData!.viewBox,
              progress: _controller!.value,
              perStrokeDuration: widget.perStrokeDuration,
              interStrokeDelay: widget.interStrokeDelay,
            ),
          ),
        );
      },
    );
  }

  Future<void> _startAnimationLoop(int token) async {
    if (_controller == null) return;
    while (mounted && token == _animationToken) {
      await _controller!.forward(from: 0);
      if (!mounted || token != _animationToken) return;
      await Future.delayed(widget.pauseDuration);
      if (!mounted || token != _animationToken) return;
    }
  }
}

class _StrokeData {
  final List<Path> paths;
  final List<_StrokeNumber> numbers;
  final Size viewBox;

  const _StrokeData({
    required this.paths,
    required this.numbers,
    required this.viewBox,
  });
}

Future<_StrokeData> _loadStrokeData(String assetPath) async {
  final svgString = await rootBundle.loadString(assetPath);
  final document = XmlDocument.parse(svgString);
  final viewBox = _parseViewBox(document);

  final List<Path> paths = [];
  for (final element in document.descendants.whereType<XmlElement>()) {
    if (element.name.local != 'path') continue;
    final String? d = element.getAttribute('d');
    if (d == null || d.isEmpty) continue;
    paths.add(parseSvgPathData(d));
  }

  final List<_StrokeNumber> numbers = [];
  for (final group in document.descendants.whereType<XmlElement>()) {
    if (group.name.local != 'g') continue;
    final String? groupId = group.getAttribute('id');
    if (groupId == null || !groupId.startsWith('kvg:StrokeNumbers_')) {
      continue;
    }
    for (final element in group.descendants.whereType<XmlElement>()) {
      if (element.name.local != 'text') continue;
      final value = element.innerText.trim();
      if (value.isEmpty) continue;
      final int? number = int.tryParse(value);
      if (number == null) continue;
      final Offset? position = _parseTextPosition(element);
      if (position == null) continue;
      numbers.add(_StrokeNumber(number: number, position: position));
    }
  }

  return _StrokeData(paths: paths, numbers: numbers, viewBox: viewBox);
}

Size _parseViewBox(XmlDocument document) {
  final String? viewBox = document.rootElement.getAttribute('viewBox');
  if (viewBox == null) {
    return const Size(109, 109);
  }
  final parts = viewBox.split(RegExp(r'[\s,]+'));
  if (parts.length < 4) {
    return const Size(109, 109);
  }
  final width = double.tryParse(parts[2]) ?? 109;
  final height = double.tryParse(parts[3]) ?? 109;
  return Size(width, height);
}

Offset? _parseTransformPosition(String? transform) {
  if (transform == null) return null;
  final match = RegExp(r'matrix\(([^)]+)\)').firstMatch(transform);
  if (match == null) return null;
  final parts = match.group(1)!.split(RegExp(r'[\s,]+'));
  if (parts.length < 6) return null;
  final double? tx = double.tryParse(parts[4]);
  final double? ty = double.tryParse(parts[5]);
  if (tx == null || ty == null) return null;
  return Offset(tx, ty);
}

Offset? _parseTextPosition(XmlElement element) {
  final String? transform = element.getAttribute('transform');
  final Offset? matrixPos = _parseTransformPosition(transform);
  if (matrixPos != null) return matrixPos;
  if (transform != null) {
    final translateMatch =
        RegExp(r'translate\(([^)]+)\)').firstMatch(transform);
    if (translateMatch != null) {
      final parts = translateMatch.group(1)!.split(RegExp(r'[\s,]+'));
      if (parts.isNotEmpty) {
        final double? tx = double.tryParse(parts[0]);
        final double? ty = parts.length > 1 ? double.tryParse(parts[1]) : 0.0;
        if (tx != null && ty != null) {
          return Offset(tx, ty);
        }
      }
    }
  }
  final String? xAttr = element.getAttribute('x');
  final String? yAttr = element.getAttribute('y');
  if (xAttr != null && yAttr != null) {
    final double? x = double.tryParse(xAttr);
    final double? y = double.tryParse(yAttr);
    if (x != null && y != null) {
      return Offset(x, y);
    }
  }
  return null;
}

class _StrokeNumber {
  final int number;
  final Offset position;

  const _StrokeNumber({
    required this.number,
    required this.position,
  });
}

class _StrokeOrderPainter extends CustomPainter {
  final List<Path> paths;
  final List<_StrokeNumber> numbers;
  final Size viewBox;
  final double progress;
  final Duration perStrokeDuration;
  final Duration interStrokeDelay;

  _StrokeOrderPainter({
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
    final List<_StrokeNumber> ordered = List.from(numbers)
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
  bool shouldRepaint(covariant _StrokeOrderPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.paths != paths ||
        oldDelegate.numbers != numbers ||
        oldDelegate.viewBox != viewBox ||
        oldDelegate.perStrokeDuration != perStrokeDuration ||
        oldDelegate.interStrokeDelay != interStrokeDelay;
  }
}
