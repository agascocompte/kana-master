import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kana_master/constants.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:xml/xml.dart';

class KanaStrokeAnimation extends StatefulWidget {
  final String assetPath;

  const KanaStrokeAnimation({
    super.key,
    required this.assetPath,
  });

  @override
  State<KanaStrokeAnimation> createState() => _KanaStrokeAnimationState();
}

class _KanaStrokeAnimationState extends State<KanaStrokeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  _StrokeData? _strokeData;
  bool _loadFailed = false;

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
        });
        return;
      }
      _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600 * data.paths.length),
      )..repeat();
      setState(() {
        _strokeData = data;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _strokeData = const _StrokeData(paths: [], viewBox: Size(109, 109));
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
              viewBox: _strokeData!.viewBox,
              progress: _controller!.value,
            ),
          ),
        );
      },
    );
  }
}

class _StrokeData {
  final List<Path> paths;
  final Size viewBox;

  const _StrokeData({
    required this.paths,
    required this.viewBox,
  });
}

Future<_StrokeData> _loadStrokeData(String assetPath) async {
  final svgString = await rootBundle.loadString(assetPath);
  final document = XmlDocument.parse(svgString);
  final viewBox = _parseViewBox(document);

  final List<Path> paths = [];
  for (final element in document.findAllElements('path')) {
    final String? d = element.getAttribute('d');
    if (d == null || d.isEmpty) continue;
    paths.add(parseSvgPathData(d));
  }

  return _StrokeData(paths: paths, viewBox: viewBox);
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

class _StrokeOrderPainter extends CustomPainter {
  final List<Path> paths;
  final Size viewBox;
  final double progress;

  _StrokeOrderPainter({
    required this.paths,
    required this.viewBox,
    required this.progress,
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

    final Paint completedPaint = Paint()
      ..color = jLightBLue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 4.0;

    final Paint activePaint = Paint()
      ..color = jOrange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 5.0;

    final int total = paths.length;
    final double scaled = progress * total;
    final int current = scaled.floor().clamp(0, total - 1);
    final double currentProgress = scaled - current;

    for (int i = 0; i < total; i++) {
      if (i < current) {
        canvas.drawPath(paths[i], completedPaint);
      } else if (i == current) {
        _drawPartialPath(canvas, paths[i], currentProgress, activePaint);
      }
    }
    canvas.restore();
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
        oldDelegate.viewBox != viewBox;
  }
}
