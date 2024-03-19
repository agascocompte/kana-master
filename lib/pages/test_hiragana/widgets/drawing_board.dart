import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/domain/models/paint_stroke.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/bloc/test_hiragana_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestHiraganaBloc, TestHiraganaState>(
      builder: (context, state) {
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
                context.read<TestHiraganaBloc>().add(AddStroke(
                    stroke: PaintStroke(from: _lastPoint!, to: currentPoint)));
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
            painter: DrawingPainter(state.stateData.strokes),
            size: Size.infinite,
            child: Container(),
          ),
        );
      },
    );
  }
}
