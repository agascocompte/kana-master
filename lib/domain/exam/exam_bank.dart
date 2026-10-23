import 'dart:convert';
import 'dart:math';

import 'package:kana_master/domain/exam/exam_models.dart';

/// Asset with the item bank of [mondai]: a JSON array of items.
String examBankAsset(Mondai mondai) => 'assets/exam/bank/${mondai.name}.json';

String examAudioAsset(String name) => 'assets/exam/audio/$name.mp3';

/// Languages with their own explanations and translations of the items.
/// Japanese has none: the questions are already in Japanese.
const List<String> examTextLanguages = [
  'en', 'es', 'ca', 'de', 'fr', 'it', 'pt', 'ru', 'ko', 'zh', //
];

/// Explanations and translations of the items of [mondai] in [language].
String examTextsAsset(String language, Mondai mondai) =>
    'assets/exam/i18n/$language/${mondai.name}.json';

/// [language] if it has texts of its own, English otherwise.
String examTextLanguage(String language) =>
    examTextLanguages.contains(language) ? language : 'en';

/// One entry of an item bank. Most entries give one question; passages give
/// several.
abstract class BankItem {
  final String id;
  final Mondai mondai;

  /// Words the item tests, so one test does not ask the same word twice.
  final List<String> tags;

  const BankItem(
      {required this.id, required this.mondai, this.tags = const []});

  int get questionCount => 1;

  /// Questions numbered from [firstNumber], with shuffled options.
  List<ExamQuestion> toQuestions(Random rng, int firstNumber);

  static BankItem fromJson(Mondai mondai, Map<String, dynamic> json) {
    return switch (mondai) {
      Mondai.sentenceOrder => OrderItem.fromJson(json),
      Mondai.textGrammar => TextGrammarItem.fromJson(json),
      Mondai.midReading => MidReadingItem.fromJson(json),
      Mondai.taskListening ||
      Mondai.pointListening ||
      Mondai.utterance ||
      Mondai.quickResponse =>
        ListeningItem.fromJson(mondai, json),
      _ => ChoiceItem.fromJson(mondai, json),
    };
  }
}

/// Shuffles [options], whose first entry is the right one, and returns them
/// with the new index of the right answer.
(List<String>, int) shuffleOptions(List<String> options, Random rng) {
  final order = List<int>.generate(options.length, (i) => i)..shuffle(rng);
  return ([for (final i in order) options[i]], order.indexOf(0));
}

List<String> _strings(dynamic value) =>
    (value as List<dynamic>? ?? const []).map((e) => e as String).toList();

/// Single question with four written options, the right one listed first.
/// Reading items also carry the text they ask about.
class ChoiceItem extends BankItem {
  final String stem;
  final List<String> options;
  final String explanation;
  final String? text;

  /// Spanish translation of the sentence (`t`) and of the text (`tt`).
  final String? translation;
  final String? textTranslation;

  const ChoiceItem({
    required super.id,
    required super.mondai,
    super.tags,
    required this.stem,
    required this.options,
    this.explanation = '',
    this.text,
    this.translation,
    this.textTranslation,
  });

  factory ChoiceItem.fromJson(Mondai mondai, Map<String, dynamic> json) {
    return ChoiceItem(
      id: json['id'] as String,
      mondai: mondai,
      tags: _strings(json['w']),
      stem: json['q'] as String,
      options: _strings(json['o']),
      explanation: json['e'] as String? ?? '',
      text: json['text'] as String?,
      translation: json['t'] as String?,
      textTranslation: json['tt'] as String?,
    );
  }

  @override
  List<ExamQuestion> toQuestions(Random rng, int firstNumber) {
    final (shuffled, correct) = shuffleOptions(options, rng);
    return [
      ExamQuestion(
        itemId: id,
        mondai: mondai,
        number: firstNumber,
        stem: stem,
        options: shuffled,
        correctIndex: correct,
        explanation: explanation,
        passage: text == null
            ? null
            : ExamPassage(id: id, text: text!, translation: textTranslation),
        translation: translation,
      ),
    ];
  }
}

/// 文の組み立て: four pieces to put in order; the question asks for the one
/// that lands on the star.
class OrderItem extends BankItem {
  final String before;
  final String after;
  final List<String> parts;
  final int star;
  final String explanation;
  final String? translation;

  const OrderItem({
    required super.id,
    super.tags,
    required this.before,
    required this.after,
    required this.parts,
    required this.star,
    this.explanation = '',
    this.translation,
  }) : super(mondai: Mondai.sentenceOrder);

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as String,
      tags: _strings(json['w']),
      before: json['pre'] as String? ?? '',
      after: json['post'] as String? ?? '',
      parts: _strings(json['parts']),
      star: json['star'] as int,
      explanation: json['e'] as String? ?? '',
      translation: json['t'] as String?,
    );
  }

  @override
  List<ExamQuestion> toQuestions(Random rng, int firstNumber) {
    final starPart = parts[star];
    final shuffled = [...parts]..shuffle(rng);
    return [
      ExamQuestion(
        itemId: id,
        mondai: mondai,
        number: firstNumber,
        stem: '',
        options: shuffled,
        correctIndex: shuffled.indexOf(starPart),
        explanation: explanation,
        orderBefore: before,
        orderAfter: after,
        starSlot: star,
        orderSolution: parts,
        translation: translation,
      ),
    ];
  }
}

class SubQuestion {
  final String stem;
  final List<String> options;
  final String explanation;
  final String? translation;

  const SubQuestion({
    required this.stem,
    required this.options,
    this.explanation = '',
    this.translation,
  });

  factory SubQuestion.fromJson(Map<String, dynamic> json) {
    return SubQuestion(
      stem: json['q'] as String? ?? '',
      options: _strings(json['o']),
      explanation: json['e'] as String? ?? '',
      translation: json['t'] as String?,
    );
  }
}

/// 文章の文法: a passage with blanks written `[[1]]`, `[[2]]`… which become
/// the question numbers of the test.
class TextGrammarItem extends BankItem {
  final String text;
  final List<SubQuestion> blanks;

  /// Spanish translation of the passage with the blanks filled in.
  final String? textTranslation;

  const TextGrammarItem({
    required super.id,
    super.tags,
    required this.text,
    required this.blanks,
    this.textTranslation,
  }) : super(mondai: Mondai.textGrammar);

  factory TextGrammarItem.fromJson(Map<String, dynamic> json) {
    return TextGrammarItem(
      id: json['id'] as String,
      tags: _strings(json['w']),
      text: json['text'] as String,
      blanks: (json['blanks'] as List<dynamic>)
          .map((b) => SubQuestion.fromJson(b as Map<String, dynamic>))
          .toList(),
      textTranslation: json['tt'] as String?,
    );
  }

  @override
  int get questionCount => blanks.length;

  @override
  List<ExamQuestion> toQuestions(Random rng, int firstNumber) {
    var numbered = text;
    for (var i = 0; i < blanks.length; i++) {
      numbered = numbered.replaceAll('[[${i + 1}]]', '［${firstNumber + i}］');
    }
    final passage =
        ExamPassage(id: id, text: numbered, translation: textTranslation);
    return [
      for (var i = 0; i < blanks.length; i++)
        _question(rng, firstNumber + i, i, passage),
    ];
  }

  ExamQuestion _question(Random rng, int number, int i, ExamPassage passage) {
    final (shuffled, correct) = shuffleOptions(blanks[i].options, rng);
    return ExamQuestion(
      itemId: '$id#${i + 1}',
      mondai: mondai,
      number: number,
      stem: '［$number］',
      options: shuffled,
      correctIndex: correct,
      explanation: blanks[i].explanation,
      passage: passage,
      translation: blanks[i].translation,
    );
  }
}

/// 内容理解（中文）: one passage with two questions.
class MidReadingItem extends BankItem {
  final String text;
  final List<SubQuestion> questions;
  final String? textTranslation;

  const MidReadingItem({
    required super.id,
    super.tags,
    required this.text,
    required this.questions,
    this.textTranslation,
  }) : super(mondai: Mondai.midReading);

  factory MidReadingItem.fromJson(Map<String, dynamic> json) {
    return MidReadingItem(
      id: json['id'] as String,
      tags: _strings(json['w']),
      text: json['text'] as String,
      questions: (json['qs'] as List<dynamic>)
          .map((q) => SubQuestion.fromJson(q as Map<String, dynamic>))
          .toList(),
      textTranslation: json['tt'] as String?,
    );
  }

  @override
  int get questionCount => questions.length;

  @override
  List<ExamQuestion> toQuestions(Random rng, int firstNumber) {
    final passage =
        ExamPassage(id: id, text: text, translation: textTranslation);
    return [
      for (var i = 0; i < questions.length; i++)
        () {
          final (shuffled, correct) = shuffleOptions(questions[i].options, rng);
          return ExamQuestion(
            itemId: '$id#${i + 1}',
            mondai: mondai,
            number: firstNumber + i,
            stem: questions[i].stem,
            options: shuffled,
            correctIndex: correct,
            explanation: questions[i].explanation,
            passage: passage,
            translation: questions[i].translation,
          );
        }(),
    ];
  }
}

/// Listening item. Printed options (もんだい１・２) are shuffled; spoken
/// options (もんだい３・４) keep the order of the recording and give the
/// right one in `a`.
class ListeningItem extends BankItem {
  final List<ScriptLine> script;
  final List<String> options;
  final int answer;
  final String explanation;
  final String? scene;

  /// Spanish translation of everything said.
  final String? translation;

  const ListeningItem({
    required super.id,
    required super.mondai,
    super.tags,
    required this.script,
    required this.options,
    this.answer = 0,
    this.explanation = '',
    this.scene,
    this.translation,
  });

  factory ListeningItem.fromJson(Mondai mondai, Map<String, dynamic> json) {
    return ListeningItem(
      id: json['id'] as String,
      mondai: mondai,
      tags: _strings(json['w']),
      script: listeningScript(mondai, json),
      options: _strings(json['o']),
      answer: json['a'] as int? ?? 0,
      explanation: json['e'] as String? ?? '',
      scene: json['scene'] as String?,
      translation: json['t'] as String?,
    );
  }

  @override
  List<ExamQuestion> toQuestions(Random rng, int firstNumber) {
    final clip = ListeningClip(
      audioAsset: examAudioAsset(id),
      script: script,
      scene: scene,
    );
    if (mondai.hasSpokenOptions) {
      return [
        ExamQuestion(
          itemId: id,
          mondai: mondai,
          number: firstNumber,
          stem: '',
          options: options,
          correctIndex: answer,
          explanation: explanation,
          clip: clip,
          translation: translation,
        ),
      ];
    }
    final (shuffled, correct) = shuffleOptions(options, rng);
    return [
      ExamQuestion(
        itemId: id,
        mondai: mondai,
        number: firstNumber,
        stem: '',
        options: shuffled,
        correctIndex: correct,
        explanation: explanation,
        clip: clip,
        translation: translation,
      ),
    ];
  }
}

/// Everything said in a listening item, in the order of the recording
/// (without the item number, which is a separate clip). The audio generator
/// in `tools/exam_audio` builds the recordings from the same JSON.
List<ScriptLine> listeningScript(Mondai mondai, Map<String, dynamic> json) {
  ScriptLine line(dynamic raw) {
    final pair = _strings(raw);
    return ScriptLine(pair[0], pair[1]);
  }

  final options = _strings(json['o']);
  switch (mondai) {
    case Mondai.taskListening:
    case Mondai.pointListening:
      final question = json['q'] as String;
      return [
        ScriptLine('N', json['intro'] as String),
        ScriptLine('N', question),
        for (final l in json['lines'] as List<dynamic>) line(l),
        ScriptLine('N', question),
      ];
    case Mondai.utterance:
      final speaker = json['say'] as String;
      return [
        ScriptLine('N', json['situation'] as String),
        for (var i = 0; i < options.length; i++)
          ScriptLine(speaker, '${i + 1}　${options[i]}'),
      ];
    case Mondai.quickResponse:
      final responder = json['resp'] as String;
      return [
        line(json['line']),
        for (var i = 0; i < options.length; i++)
          ScriptLine(responder, '${i + 1}　${options[i]}'),
      ];
    default:
      throw ArgumentError('$mondai is not a listening question');
  }
}

class ExamBank {
  final Map<Mondai, List<BankItem>> items;

  const ExamBank(this.items);

  /// Parses the bank files, given as JSON strings per question type, with
  /// the explanations and translations of one language in [texts].
  factory ExamBank.fromJsonStrings(
    Map<Mondai, String> sources, {
    Map<Mondai, String> texts = const {},
  }) {
    return ExamBank({
      for (final entry in sources.entries)
        entry.key: () {
          final extra = texts[entry.key] == null
              ? const <String, dynamic>{}
              : json.decode(texts[entry.key]!) as Map<String, dynamic>;
          return [
            for (final raw in json.decode(entry.value) as List<dynamic>)
              BankItem.fromJson(
                entry.key,
                _withTexts(
                  raw as Map<String, dynamic>,
                  extra[raw['id']] as Map<String, dynamic>?,
                ),
              ),
          ];
        }(),
    });
  }

  /// [item] with the fields of [texts] added, sub-questions included.
  static Map<String, dynamic> _withTexts(
    Map<String, dynamic> item,
    Map<String, dynamic>? texts,
  ) {
    if (texts == null) return item;
    final merged = {...item};
    for (final entry in texts.entries) {
      if (entry.value is List) {
        final subs = item[entry.key] as List<dynamic>;
        final extra = entry.value as List<dynamic>;
        merged[entry.key] = [
          for (var i = 0; i < subs.length; i++)
            {
              ...subs[i] as Map<String, dynamic>,
              if (i < extra.length) ...extra[i] as Map<String, dynamic>,
            },
        ];
      } else {
        merged[entry.key] = entry.value;
      }
    }
    return merged;
  }

  int get size => items.values.fold(0, (sum, list) => sum + list.length);
}
