import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:image/image.dart' as img;
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
  GlobalKey painterKey = GlobalKey();

  Future<void> captureAndProcessImage() async {
    RenderRepaintBoundary boundary =
        painterKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      Uint8List imageBytes = byteData.buffer.asUint8List();
      img.Image? originalImage = img.decodeImage(imageBytes);

      if (originalImage != null) {
        img.Image resizedImage = img.copyResize(originalImage,
            width: imageDimensions,
            height: imageDimensions,
            interpolation: img.Interpolation.nearest);

        if (!mounted) return;

        context
            .read<TestHiraganaBloc>()
            .add(EvaluateImage(image: resizedImage));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestHiraganaBloc, TestHiraganaState>(
      listener: (context, state) {
        if (state is TestHiraganaCapturing) {
          captureAndProcessImage();
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onPanStart: (details) {
            setState(() {
              _lastPoint = details.localPosition;
            });
          },
          onPanUpdate: (details) {
            if (!state.stateData.canSubmitAnswer) {
              context.read<TestHiraganaBloc>().add(EnableCheckAnswer());
            }
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
          child: RepaintBoundary(
            key: painterKey,
            child: CustomPaint(
              painter: DrawingPainter(state.stateData.strokes),
              size: Size.infinite,
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}
