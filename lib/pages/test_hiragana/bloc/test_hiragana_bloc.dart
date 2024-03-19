import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/constants.dart';
import 'package:hiragana_japanesse/domain/models/paint_stroke.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

part 'test_hiragana_event.dart';
part 'test_hiragana_state.dart';

@injectable
class TestHiraganaBloc extends Bloc<TestHiraganaEvent, TestHiraganaState> {
  TestHiraganaBloc() : super(TestHiraganaInitial()) {
    on<BeginTest>(_beginTest);
    on<AddStroke>(_addStroke);
    on<ClearDrawing>(_clearDrawing);
    on<EvaluateImage>(_evaluateImage);
    on<CaptureImage>(_captureImage);
  }

  FutureOr<void> _beginTest(BeginTest event, Emitter<TestHiraganaState> emit) {
    final random = math.Random();
    emit(TestHiraganaDraw(state.stateData.copyWith(
      hiraganaIndex: random.nextInt(hiraganas.length),
    )));
  }

  FutureOr<void> _addStroke(AddStroke event, Emitter<TestHiraganaState> emit) {
    List<PaintStroke> strokes = List.from(state.stateData.strokes);
    strokes.add(event.stroke);
    emit(UpdatedStrokes(state.stateData.copyWith(strokes: strokes)));
  }

  FutureOr<void> _clearDrawing(
      ClearDrawing event, Emitter<TestHiraganaState> emit) {
    emit(TestHiraganaInitial());
  }

  FutureOr<void> _evaluateImage(
      EvaluateImage event, Emitter<TestHiraganaState> emit) async {
    Interpreter interpreter =
        await Interpreter.fromAsset('assets/models/model.tflite');
    var predictions = await predict(event.image, interpreter);
    List<double> p = predictions![0]
        .cast<double>(); // Asume que 'output' es List<List<dynamic>>
    int predictedIndex = getIndexOfMaxValue(p);
    print(
        "El hiragana predecido es ${hiraganas.values.toList()[predictedIndex]}");
  }

  FutureOr<void> _captureImage(
      CaptureImage event, Emitter<TestHiraganaState> emit) {
    emit(TestHiraganaCapturing(state.stateData));
  }

  Future<void> saveImage(Uint8List pngBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'myImage.png');
    final file = File(path);
    await file.writeAsBytes(pngBytes);
  }

  // Private functions
  img.Image preprocessImage(img.Image image) {
    img.Image resizedImg = img.copyResize(image, width: 28, height: 28);
    return img.grayscale(resizedImg);
  }

  Float32List imageToByteListFloat32(img.Image image) {
    var convertedBytes = Float32List(1 * 28 * 28);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (int i = 0; i < 28; i++) {
      for (int j = 0; j < 28; j++) {
        img.Pixel pixel = image.getPixel(j, i);
        num red = pixel.r;
        num green = pixel.g;
        num blue = pixel.b;

        // Verificar que la conversión a gris no resulte en cero
        double grayScale = (0.299 * red + 0.587 * green + 0.114 * blue) / 255.0;
        buffer[pixelIndex++] = grayScale;
      }
    }
    return buffer;
  }

  Future<List?> predict(img.Image image, Interpreter interpreter) async {
    List? output;
    try {
      img.Image preprocessedImage = preprocessImage(image);
      var input = imageToByteListFloat32(preprocessedImage);
      var inputTensor = input.reshape([1, 28, 28, 1]);
      output = List.filled(49, 0).reshape([1, 49]);
      interpreter.run(inputTensor, output);
    } catch (e) {
      print("Error al realizar la predicción: $e");
    }
    return output;
  }

  int getIndexOfMaxValue(List<double> predictions) {
    if (predictions.isEmpty) return -1;
    double maxValue = predictions[0];
    int maxIndex = 0;
    for (int i = 1; i < predictions.length - 1; i++) {
      if (predictions[i] > maxValue) {
        maxValue = predictions[i];
        maxIndex = i;
      }
    }
    return maxIndex;
  }
}
