import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/domain/exam/exam_scoring.dart';
import 'package:kana_master/domain/repositories/exam_repository.dart';

enum ExamPhase {
  /// Cover page of a section, before its time starts.
  sectionIntro,
  answering,
  finished,
}

class ExamSessionState {
  final ExamPaper paper;
  final int sectionIndex;
  final ExamPhase phase;

  /// Index of the question on screen within the current section.
  final int questionIndex;
  final Map<ExamQuestion, int> answers;

  /// When the time of the current section runs out.
  final DateTime? deadline;
  final ExamScore? score;

  const ExamSessionState({
    required this.paper,
    this.sectionIndex = 0,
    this.phase = ExamPhase.sectionIntro,
    this.questionIndex = 0,
    this.answers = const {},
    this.deadline,
    this.score,
  });

  ExamSection get section => paper.sections[sectionIndex];
  List<ExamQuestion> get questions => paper.questions[section]!;
  ExamQuestion get question => questions[questionIndex];
  bool get isLastSection => sectionIndex == paper.sections.length - 1;

  int get unansweredInSection =>
      questions.where((q) => !answers.containsKey(q)).length;

  ExamSessionState copyWith({
    int? sectionIndex,
    ExamPhase? phase,
    int? questionIndex,
    Map<ExamQuestion, int>? answers,
    DateTime? deadline,
    ExamScore? score,
  }) {
    return ExamSessionState(
      paper: paper,
      sectionIndex: sectionIndex ?? this.sectionIndex,
      phase: phase ?? this.phase,
      questionIndex: questionIndex ?? this.questionIndex,
      answers: answers ?? this.answers,
      deadline: deadline ?? this.deadline,
      score: score ?? this.score,
    );
  }
}

class ExamSessionCubit extends Cubit<ExamSessionState> {
  final ExamRepository _repository;
  final DateTime Function() _now;

  ExamSessionCubit({
    required ExamPaper paper,
    required ExamRepository repository,
    DateTime Function()? now,
  })  : _repository = repository,
        _now = now ?? DateTime.now,
        super(ExamSessionState(paper: paper));

  void startSection() {
    emit(state.copyWith(
      phase: ExamPhase.answering,
      questionIndex: 0,
      deadline: _now().add(Duration(minutes: state.section.minutes)),
    ));
  }

  void answer(ExamQuestion question, int option) {
    if (state.phase != ExamPhase.answering) return;
    emit(state.copyWith(answers: {...state.answers, question: option}));
  }

  void goTo(int index) {
    if (index < 0 || index >= state.questions.length) return;
    emit(state.copyWith(questionIndex: index));
  }

  void next() => goTo(state.questionIndex + 1);

  void previous() => goTo(state.questionIndex - 1);

  /// Ends the current section, by the user or when time is up, and moves on
  /// to the next one or to the results.
  Future<void> finishSection() async {
    if (state.phase != ExamPhase.answering) return;
    if (!state.isLastSection) {
      emit(state.copyWith(
        sectionIndex: state.sectionIndex + 1,
        phase: ExamPhase.sectionIntro,
        questionIndex: 0,
      ));
      return;
    }
    final score = ExamScore.grade(state.paper.allQuestions, state.answers);
    emit(state.copyWith(phase: ExamPhase.finished, score: score));
    await _repository.saveResult(state.paper, state.answers, score);
  }

  /// Whether the time of the running section is over.
  bool get timeIsUp =>
      state.deadline != null && !_now().isBefore(state.deadline!);

  Duration get remaining {
    final deadline = state.deadline;
    if (deadline == null) return Duration.zero;
    final left = deadline.difference(_now());
    return left.isNegative ? Duration.zero : left;
  }
}
