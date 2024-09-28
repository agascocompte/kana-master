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

part 'test_kana_event.dart';
part 'test_kana_state.dart';

@injectable
class TestKanaBloc extends Bloc<TestKanaEvent, TestKanaState> {
  final random = math.Random();
  Interpreter? interpreter;

  TestKanaBloc() : super(TestKanaInitial()) {
    on<BeginTest>(_beginTest);
    on<EnableCheckAnswer>(_setDrawingStarted);
    on<AddStroke>(_addStroke);
    on<ClearDrawing>(_clearDrawing);
    on<ResetTest>(_resetTest);
    on<EvaluateImage>(_evaluateImage);
    on<CaptureImage>(_captureImage);
    on<TestNextKana>(_nextKana);
    on<UpdateUserKanaIndexAnswer>(updateUserKanaIndexAnswer);
    on<CheckAnswer>(_checkAnswer);
  }

  Future<void> _loadModel() async {
    interpreter =
        await Interpreter.fromAsset('assets/models/model_etl8g.tflite');
  }

  @override
  Future<void> close() {
    interpreter?.close();
    return super.close();
  }

  FutureOr<void> _beginTest(BeginTest event, Emitter<TestKanaState> emit) {
    TestType testType = event.isDrawingTestEnabled
        ? TestType.values[random.nextInt(TestType.values.length)]
        : TestType.singleChoiceTest;
    emit(TestKanaDraw(state.stateData.copyWith(
      kanaIndex: random.nextInt(testType == TestType.drawingTest
          ? hiraganaWithoutWo.length
          : event.kana.length),
      testType: testType,
    )));
  }

  FutureOr<void> _setDrawingStarted(
      EnableCheckAnswer event, Emitter<TestKanaState> emit) {
    emit(TestKanaDraw(state.stateData.copyWith(canSubmitAnswer: true)));
  }

  FutureOr<void> _addStroke(AddStroke event, Emitter<TestKanaState> emit) {
    List<PaintStroke> strokes = List.from(state.stateData.strokes);
    strokes.add(event.stroke);
    emit(UpdatedStrokes(state.stateData.copyWith(strokes: strokes)));
  }

  FutureOr<void> _clearDrawing(
      ClearDrawing event, Emitter<TestKanaState> emit) {
    emit(UpdatedStrokes(
        state.stateData.copyWith(strokes: [], canSubmitAnswer: false)));
  }

  FutureOr<void> _resetTest(ResetTest event, Emitter<TestKanaState> emit) {
    emit(TestKanaInitial());
  }

  FutureOr<void> _evaluateImage(
      EvaluateImage event, Emitter<TestKanaState> emit) async {
    if (interpreter == null) {
      await _loadModel();
    }
    emit(PredictionInProgress(state.stateData));
    //await Future.delayed(const Duration(milliseconds: 1000));

    List<dynamic>? predictions = await predict(event.image, interpreter!);
    if (predictions != null) {
      List<double> p = predictions[0].cast<double>();
      int predictedIndex = getIndexOfMaxValue(p);
      if (predictedIndex == state.stateData.kanaIndex) {
        emit(HiraganaWritingSuccess(
          state.stateData,
        ));
      } else {
        emit(HiraganaWritingFail(
          state.stateData,
        ));
      }
    } else {
      emit(ErrorPredictingHiragana(state.stateData,
          msg:
              "An error occured while trying to make the hiragana prediction"));
    }
  }

  FutureOr<void> _captureImage(
      CaptureImage event, Emitter<TestKanaState> emit) {
    emit(TestKanaCapturing(state.stateData));
  }

  Future<void> saveImage(Uint8List pngBytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'myImage.png');
    final file = File(path);
    await file.writeAsBytes(pngBytes);
  }

  FutureOr<void> _nextKana(TestNextKana event, Emitter<TestKanaState> emit) {
    add(ClearDrawing());
    TestType testType = event.isDrawingTestEnabled
        ? TestType.values[random.nextInt(TestType.values.length)]
        : TestType.singleChoiceTest;
    emit(NextKanaLoaded(state.stateData.copyWith(
      kanaIndex: random.nextInt(testType == TestType.drawingTest
          ? hiraganaWithoutWo.length
          : event.kana.length),
      testType: testType,
    )));
  }

  FutureOr<void> updateUserKanaIndexAnswer(
      UpdateUserKanaIndexAnswer event, Emitter<TestKanaState> emit) {
    emit(UserKanaIndexAnswerUpdated(
        state.stateData.copyWith(userAnswerKanaIndex: event.userIndex)));
  }

  FutureOr<void> _checkAnswer(CheckAnswer event, Emitter<TestKanaState> emit) {
    if (state.stateData.kanaIndex == state.stateData.userAnswerKanaIndex) {
      emit(KanaSelectedSuccess(
        state.stateData,
      ));
    } else {
      emit(KanaSelectedFail(
        state.stateData,
      ));
    }
  }

  // Private functions
  img.Image preprocessImage(img.Image image) {
    img.Image resizedImg =
        img.copyResize(image, width: imageDimensions, height: imageDimensions);
    return img.grayscale(resizedImg);
  }

  Float32List imageToByteListFloat32(img.Image image) {
    var convertedBytes = Float32List(1 * imageDimensions * imageDimensions);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (int i = 0; i < imageDimensions; i++) {
      for (int j = 0; j < imageDimensions; j++) {
        img.Pixel pixel = image.getPixel(j, i);
        num red = pixel.r;
        num green = pixel.g;
        num blue = pixel.b;

        double grayValue = 0.299 * red + 0.587 * green + 0.114 * blue;
        buffer[pixelIndex++] = grayValue;
      }
    }
    return buffer;
  }

  Future<List?> predict(img.Image image, Interpreter interpreter) async {
    List? output;
    try {
      img.Image preprocessedImage = preprocessImage(image);
      var input = imageToByteListFloat32(preprocessedImage);
      var inputTensor = input.reshape([1, imageDimensions, imageDimensions, 1]);
      output = List.filled(totalClasses, 0).reshape([1, totalClasses]);
      interpreter.run(inputTensor, output);
    } catch (e) {
      return null;
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
