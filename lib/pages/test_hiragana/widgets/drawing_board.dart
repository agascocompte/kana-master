import 'package:flutter/material.dart';
import 'package:hiragana_japanesse/domain/models/paint_stroke.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/widgets/drawing_painter.dart';

class DrawingBoard extends StatefulWidget {
  const DrawingBoard({
    super.key,
  });

  @override
  DrawingBoardState createState() => DrawingBoardState();
}

class DrawingBoardState extends State<DrawingBoard> {
  Offset? _lastPoint;
  final List<PaintStroke> _strokes = [];

  void addStroke(PaintStroke stroke) {
    setState(() {
      _strokes.add(stroke);
    });
  }

  void clearBoard() {
    setState(() {
      _strokes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        setState(() {
          _lastPoint = details.localPosition;
        });
      },
      onPanUpdate: (details) {
        setState(() {
          Offset currentPoint = details.localPosition;
          if (_lastPoint != null) {
            addStroke(PaintStroke(from: _lastPoint!, to: currentPoint));
          }
          _lastPoint = currentPoint;
        });
      },
      onPanEnd: (details) {
        setState(() {
          _lastPoint = null;
        });
      },
      child: CustomPaint(
        painter: DrawingPainter(_strokes),
        size: Size.infinite,
        child: Container(),
      ),
    );
  }
}
