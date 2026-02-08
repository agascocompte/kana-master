import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kana_master/domain/models/stroke_data.dart';
import 'package:kana_master/domain/models/stroke_number.dart';
import 'package:kana_master/pages/learn/widgets/stroke_order_painter.dart';
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
    this.perStrokeDuration = const Duration(milliseconds: 800),
    this.interStrokeDelay = const Duration(milliseconds: 250),
    this.pauseDuration = const Duration(milliseconds: 2300),
  });

  @override
  State<KanaStrokeAnimation> createState() => _KanaStrokeAnimationState();
}

class _KanaStrokeAnimationState extends State<KanaStrokeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  StrokeData? _strokeData;
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
        _strokeData = const StrokeData(
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
            painter: StrokeOrderPainter(
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

Future<StrokeData> _loadStrokeData(String assetPath) async {
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

  final List<StrokeNumber> numbers = [];
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
      numbers.add(StrokeNumber(number: number, position: position));
    }
  }

  return StrokeData(paths: paths, numbers: numbers, viewBox: viewBox);
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
