import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/paint_stroke.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
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
  final ModelConfig _hiraganaModelConfig = hiraganaModelV2;
  final ModelConfig _katakanaModelConfig = katakanaModelV1;
  final ModelConfig _kanjiModelConfig = kanjiModelV1;
  KanaType _currentKanaType = KanaType.hiragana;
  List<KanjiEntry> _kanjiEntries = const [];
  Map<String, List<String>> _kanjiMeanings = const {};
  ModelConfig? _loadedModelConfig;

  TestKanaBloc() : super(TestKanaInitial()) {
    on<BeginTest>(_beginTest);
    on<EnableCheckAnswer>(_setDrawingStarted);
    on<AddStroke>(_addStroke);
    on<ClearDrawing>(_clearDrawing);
    on<ResetTest>(_resetTest);
    on<EvaluateImage>(_evaluateImage);
    on<CaptureImage>(_captureImage);
    on<TestNextKana>(_nextKana);
    on<UpdateUserKanaIndexAnswer>(_updateUserKanaIndexAnswer);
    on<UpdateUserTextAnswer>(_updateUserTextAnswer);
    on<CheckAnswer>(_checkAnswer);
  }

  Future<void> _loadModel(ModelConfig modelConfig) async {
    if (_loadedModelConfig?.assetPath == modelConfig.assetPath &&
        interpreter != null) {
      return;
    }
    interpreter?.close();
    interpreter = await Interpreter.fromAsset(modelConfig.assetPath);
    _loadedModelConfig = modelConfig;
  }

  @override
  Future<void> close() {
    interpreter?.close();
    return super.close();
  }

  FutureOr<void> _beginTest(BeginTest event, Emitter<TestKanaState> emit) {
    _currentKanaType = event.kanaType;
    _kanjiEntries = event.kanjiEntries;
    _kanjiMeanings = event.kanjiMeanings;
    TestType testType = event.difficultyLevel == DifficultyLevel.high
        ? TestType.values[random.nextInt(TestType.values.length)]
        : TestType.singleAnswer;
    emit(TestKanaDraw(state.stateData.copyWith(
      kanaIndex: _pickKanaIndex(event.kana, testType),
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
    if (_currentKanaType == KanaType.kanji && _kanjiEntries.isEmpty) {
      emit(ErrorPredictingHiragana(state.stateData,
          msg: "No kanji data loaded for prediction"));
      return;
    }
    final ModelConfig modelConfig = _modelConfigForKanaType();
    await _loadModel(modelConfig);
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
    _currentKanaType = event.kanaType;
    _kanjiEntries = event.kanjiEntries;
    _kanjiMeanings = event.kanjiMeanings;
    TestType testType = event.difficultyLevel == DifficultyLevel.high
        ? TestType.values[random.nextInt(TestType.values.length)]
        : TestType.singleAnswer;
    emit(NextKanaLoaded(state.stateData.copyWith(
      kanaIndex: _pickKanaIndex(event.kana, testType),
      testType: testType,
    )));
  }

  FutureOr<void> _updateUserKanaIndexAnswer(
      UpdateUserKanaIndexAnswer event, Emitter<TestKanaState> emit) {
    emit(UserKanaIndexAnswerUpdated(
        state.stateData.copyWith(userAnswerKanaIndex: event.userIndex)));
  }

  FutureOr<void> _updateUserTextAnswer(
      UpdateUserTextAnswer event, Emitter<TestKanaState> emit) {
    emit(UserKanaIndexAnswerUpdated(state.stateData.copyWith(
      userTextAnswer: event.userAnswer,
      canSubmitAnswer: true,
    )));
  }

  FutureOr<void> _checkAnswer(CheckAnswer event, Emitter<TestKanaState> emit) {
    if (event.kanaType == KanaType.kanji) {
      if (event.difficultyLevel == DifficultyLevel.low) {
        if (state.stateData.kanaIndex == state.stateData.userAnswerKanaIndex) {
          emit(KanaSelectedSuccess(state.stateData));
        } else {
          emit(KanaSelectedFail(state.stateData));
        }
        return null;
      }
      final int index = state.stateData.kanaIndex;
      if (index >= 0 && index < _kanjiEntries.length) {
        final String key = _kanjiEntries[index].unicode;
        final List<String> meanings = _kanjiMeanings[key] ?? const [];
        final String answer =
            state.stateData.userTextAnswer.trim().toLowerCase();
        final bool matches =
            meanings.any((meaning) => meaning.trim().toLowerCase() == answer);
        if (matches) {
          emit(KanaSelectedSuccess(state.stateData));
        } else {
          emit(KanaSelectedFail(state.stateData));
        }
      } else {
        emit(KanaSelectedFail(state.stateData));
      }
      return null;
    }
    if ((event.difficultyLevel == DifficultyLevel.low &&
            state.stateData.kanaIndex == state.stateData.userAnswerKanaIndex) ||
        (event.difficultyLevel != DifficultyLevel.low &&
            state.stateData.userTextAnswer ==
                event.kana.values.toList()[state.stateData.kanaIndex])) {
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
    final ModelConfig modelConfig = _modelConfigForKanaType();
    img.Image resizedImg = img.copyResize(
      image,
      width: modelConfig.inputSize,
      height: modelConfig.inputSize,
    );
    return img.grayscale(resizedImg);
  }

  Float32List imageToByteListFloat32(img.Image image) {
    final ModelConfig modelConfig = _modelConfigForKanaType();
    int inputSize = modelConfig.inputSize;
    double normalizeDivisor = modelConfig.normalize ? 255.0 : 1.0;
    var convertedBytes = Float32List(1 * inputSize * inputSize);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (int i = 0; i < inputSize; i++) {
      for (int j = 0; j < inputSize; j++) {
        img.Pixel pixel = image.getPixel(j, i);
        num red = pixel.r;
        num green = pixel.g;
        num blue = pixel.b;

        double grayValue = 0.299 * red + 0.587 * green + 0.114 * blue;
        buffer[pixelIndex++] = grayValue / normalizeDivisor;
      }
    }
    return buffer;
  }

  Future<List?> predict(img.Image image, Interpreter interpreter) async {
    List? output;
    try {
      img.Image preprocessedImage = preprocessImage(image);
      var input = imageToByteListFloat32(preprocessedImage);
      final ModelConfig modelConfig = _modelConfigForKanaType();
      var inputTensor =
          input.reshape([1, modelConfig.inputSize, modelConfig.inputSize, 1]);
      final int numClasses = _resolveNumClasses(modelConfig);
      output = List.filled(numClasses, 0).reshape([1, numClasses]);
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
    for (int i = 1; i < predictions.length; i++) {
      if (predictions[i] > maxValue) {
        maxValue = predictions[i];
        maxIndex = i;
      }
    }
    return maxIndex;
  }

  int _pickKanaIndex(Map<String, String> kana, TestType testType) {
    if (testType != TestType.drawingTest) {
      if (_currentKanaType == KanaType.kanji) {
        return _kanjiEntries.isEmpty ? 0 : random.nextInt(_kanjiEntries.length);
      }
      return random.nextInt(kana.length);
    }
    if (_currentKanaType == KanaType.kanji) {
      return _kanjiEntries.isEmpty ? 0 : random.nextInt(_kanjiEntries.length);
    }
    if (_currentKanaType == KanaType.katakana) {
      final String target =
          katakanaDrawingLabels[random.nextInt(katakanaDrawingLabels.length)];
      return katakanaModelLabels.indexOf(target);
    }
    return random.nextInt(hiragana.length);
  }

  ModelConfig _modelConfigForKanaType() {
    if (_currentKanaType == KanaType.katakana) {
      return _katakanaModelConfig;
    }
    if (_currentKanaType == KanaType.kanji) {
      return _kanjiModelConfig;
    }
    return _hiraganaModelConfig;
  }

  int _resolveNumClasses(ModelConfig modelConfig) {
    if (_currentKanaType == KanaType.kanji) {
      return _kanjiEntries.length;
    }
    return modelConfig.numClasses;
  }
}
