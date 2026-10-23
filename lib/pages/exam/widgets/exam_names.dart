import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/i18n/strings.g.dart';

/// Name of a section in the language of the app.
extension ExamSectionName on ExamSection {
  String get localName => switch (this) {
        ExamSection.vocabulary => t.exam.sections.vocabulary,
        ExamSection.grammarReading => t.exam.sections.grammarReading,
        ExamSection.listening => t.exam.sections.listening,
      };
}

/// Name of a question type in the language of the app.
extension MondaiName on Mondai {
  String get localName {
    final names = t.exam.mondai;
    return switch (this) {
      Mondai.kanjiReading => names.kanjiReading,
      Mondai.orthography => names.orthography,
      Mondai.contextual => names.contextual,
      Mondai.paraphrase => names.paraphrase,
      Mondai.grammarForm => names.grammarForm,
      Mondai.sentenceOrder => names.sentenceOrder,
      Mondai.textGrammar => names.textGrammar,
      Mondai.shortReading => names.shortReading,
      Mondai.midReading => names.midReading,
      Mondai.infoSearch => names.infoSearch,
      Mondai.taskListening => names.taskListening,
      Mondai.pointListening => names.pointListening,
      Mondai.utterance => names.utterance,
      Mondai.quickResponse => names.quickResponse,
    };
  }
}
