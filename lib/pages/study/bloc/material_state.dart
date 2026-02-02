part of 'material_bloc.dart';

enum MaterialMessageType { none, success, warning, error }

class MaterialStateData {
  final List<String> headers;
  final List<MaterialEntry> entries;
  final String? questionColumn;
  final String? answerColumn;
  final MaterialEntry? currentEntry;
  final bool isLoading;
  final bool showExpectedAnswer;
  final String importedFileName;
  final String userAnswer;
  final int inputVersion;
  final String message;
  final MaterialMessageType messageType;

  MaterialStateData({
    this.headers = const [],
    this.entries = const [],
    this.questionColumn,
    this.answerColumn,
    this.currentEntry,
    this.isLoading = false,
    this.showExpectedAnswer = false,
    this.importedFileName = '',
    this.userAnswer = '',
    this.inputVersion = 0,
    this.message = '',
    this.messageType = MaterialMessageType.none,
  });

  MaterialStateData copyWith({
    List<String>? headers,
    List<MaterialEntry>? entries,
    String? questionColumn,
    String? answerColumn,
    MaterialEntry? currentEntry,
    bool? isLoading,
    bool? showExpectedAnswer,
    String? importedFileName,
    String? userAnswer,
    int? inputVersion,
    String? message,
    MaterialMessageType? messageType,
  }) {
    return MaterialStateData(
      headers: headers ?? this.headers,
      entries: entries ?? this.entries,
      questionColumn: questionColumn ?? this.questionColumn,
      answerColumn: answerColumn ?? this.answerColumn,
      currentEntry: currentEntry ?? this.currentEntry,
      isLoading: isLoading ?? this.isLoading,
      showExpectedAnswer: showExpectedAnswer ?? this.showExpectedAnswer,
      importedFileName: importedFileName ?? this.importedFileName,
      userAnswer: userAnswer ?? this.userAnswer,
      inputVersion: inputVersion ?? this.inputVersion,
      message: message ?? this.message,
      messageType: messageType ?? this.messageType,
    );
  }
}

abstract class MaterialState {
  final MaterialStateData stateData;

  MaterialState({required this.stateData});
}

class MaterialInitial extends MaterialState {
  MaterialInitial() : super(stateData: MaterialStateData());
}

class MaterialLoading extends MaterialState {
  MaterialLoading(MaterialStateData stateData) : super(stateData: stateData);
}

class MaterialLoaded extends MaterialState {
  MaterialLoaded(MaterialStateData stateData) : super(stateData: stateData);
}
