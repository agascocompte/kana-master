import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kana_master/constants.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kana_master/domain/models/paint_stroke.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/drawing_painter.dart';

class DrawingBoard extends StatefulWidget {
  final bool showKanjiGuide;
  final String? kanjiGuideAssetPath;

  const DrawingBoard({
    super.key,
    this.showKanjiGuide = false,
    this.kanjiGuideAssetPath,
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
            .read<TestKanaBloc>()
            .add(EvaluateImage(image: resizedImage, pngBytes: imageBytes));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestKanaBloc, TestKanaState>(
      listener: (context, state) {
        if (state is TestKanaCapturing) {
          captureAndProcessImage();
        }
      },
      builder: (context, state) {
        final shortestSide = MediaQuery.of(context).size.shortestSide;
        final brushWidth = shortestSide >= 700 ? 16.0 : 11.5;
        return GestureDetector(
          onPanStart: (details) {
            setState(() {
              _lastPoint = details.localPosition;
            });
            context
                .read<TestKanaBloc>()
                .add(StartStroke(point: details.localPosition));
          },
          onPanUpdate: (details) {
            if (!state.stateData.canSubmitAnswer) {
              context.read<TestKanaBloc>().add(EnableCheckAnswer());
            }
            setState(() {
              Offset currentPoint = details.localPosition;
              if (_lastPoint != null) {
                context.read<TestKanaBloc>().add(AddStroke(
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
            child: Stack(
              children: [
                if (widget.showKanjiGuide && widget.kanjiGuideAssetPath != null)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Opacity(
                        opacity: 0.2,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: SvgPicture.asset(
                            widget.kanjiGuideAssetPath!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                RepaintBoundary(
                  key: painterKey,
                  child: CustomPaint(
                    painter: DrawingPainter(
                      state.stateData.strokes,
                      strokeWidth: brushWidth,
                    ),
                    size: Size.infinite,
                    child: Container(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
