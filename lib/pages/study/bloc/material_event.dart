part of 'material_bloc.dart';

abstract class MaterialEvent {}

class MaterialImportRequested extends MaterialEvent {}

class MaterialQuestionRequested extends MaterialEvent {}

class MaterialAnswerSubmitted extends MaterialEvent {}

class MaterialAnswerUpdated extends MaterialEvent {
  final String answer;

  MaterialAnswerUpdated(this.answer);
}

class MaterialQuestionColumnChanged extends MaterialEvent {
  final String? column;

  MaterialQuestionColumnChanged(this.column);
}

class MaterialAnswerColumnChanged extends MaterialEvent {
  final String? column;

  MaterialAnswerColumnChanged(this.column);
}

class MaterialToggleExpectedAnswer extends MaterialEvent {}
