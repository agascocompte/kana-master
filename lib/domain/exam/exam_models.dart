/// Structure of the JLPT N5 test as given from the December 2020 session:
/// three timed sections, fourteen question types (もんだい) and their item
/// counts.
library;

enum ExamSection {
  vocabulary(
    title: '言語知識（文字・語彙）',
    subtitle: 'Vocabulario y escritura',
    minutes: 20,
  ),
  grammarReading(
    title: '言語知識（文法）・読解',
    subtitle: 'Gramática y lectura',
    minutes: 40,
  ),
  listening(
    title: '聴解',
    subtitle: 'Comprensión auditiva',
    minutes: 30,
  );

  final String title;
  final String subtitle;
  final int minutes;

  const ExamSection({
    required this.title,
    required this.subtitle,
    required this.minutes,
  });

  List<Mondai> get mondai =>
      Mondai.values.where((m) => m.section == this).toList();
}

/// Scoring groups of the official score report. Vocabulary, grammar and
/// reading make up one 120-point scoring section; listening is worth 60.
enum ScoreArea {
  vocabulary('文字・語彙'),
  grammar('文法'),
  reading('読解'),
  listening('聴解');

  final String label;

  const ScoreArea(this.label);
}

enum Mondai {
  kanjiReading(
    section: ExamSection.vocabulary,
    number: 1,
    label: '漢字読み',
    spanish: 'Lectura de kanji',
    count: 7,
    area: ScoreArea.vocabulary,
    instruction: 'もんだい１　＿＿＿の　ことばは　ひらがなで　どう　かきますか。'
        '１・２・３・４から　いちばん　いい　ものを　ひとつ　えらんで　ください。',
  ),
  orthography(
    section: ExamSection.vocabulary,
    number: 2,
    label: '表記',
    spanish: 'Escritura',
    count: 5,
    area: ScoreArea.vocabulary,
    instruction: 'もんだい２　＿＿＿の　ことばは　どう　かきますか。'
        '１・２・３・４から　いちばん　いい　ものを　ひとつ　えらんで　ください。',
  ),
  contextual(
    section: ExamSection.vocabulary,
    number: 3,
    label: '文脈規定',
    spanish: 'Vocabulario en contexto',
    count: 6,
    area: ScoreArea.vocabulary,
    instruction: 'もんだい３　（　　）に　なにが　はいりますか。'
        '１・２・３・４から　いちばん　いい　ものを　ひとつ　えらんで　ください。',
  ),
  paraphrase(
    section: ExamSection.vocabulary,
    number: 4,
    label: '言い換え類義',
    spanish: 'Paráfrasis',
    count: 3,
    area: ScoreArea.vocabulary,
    instruction: 'もんだい４　＿＿＿の　ぶんと　だいたい　おなじ　いみの　ぶんが　あります。'
        '１・２・３・４から　いちばん　いい　ものを　ひとつ　えらんで　ください。',
  ),
  grammarForm(
    section: ExamSection.grammarReading,
    number: 1,
    label: '文の文法１（文法形式の判断）',
    spanish: 'Forma gramatical',
    count: 9,
    area: ScoreArea.grammar,
    instruction: 'もんだい１　（　　）に　何を　入れますか。'
        '１・２・３・４から　いちばん　いい　ものを　一つ　えらんで　ください。',
  ),
  sentenceOrder(
    section: ExamSection.grammarReading,
    number: 2,
    label: '文の文法２（文の組み立て）',
    spanish: 'Ordenar la frase',
    count: 4,
    area: ScoreArea.grammar,
    instruction: 'もんだい２　★に　入る　ものは　どれですか。'
        '１・２・３・４から　いちばん　いい　ものを　一つ　えらんで　ください。',
  ),
  textGrammar(
    section: ExamSection.grammarReading,
    number: 3,
    label: '文章の文法',
    spanish: 'Gramática del texto',
    count: 4,
    area: ScoreArea.grammar,
    instruction: 'もんだい３　［FIRST］から　［LAST］に　何を　入れますか。'
        'ぶんしょうの　いみを　かんがえて、'
        '１・２・３・４から　いちばん　いい　ものを　一つ　えらんで　ください。',
  ),
  shortReading(
    section: ExamSection.grammarReading,
    number: 4,
    label: '内容理解（短文）',
    spanish: 'Texto corto',
    count: 2,
    area: ScoreArea.reading,
    instruction: 'もんだい４　つぎの　（１）から　（２）の　ぶんしょうを　読んで、'
        'しつもんに　こたえて　ください。こたえは、'
        '１・２・３・４から　いちばん　いい　ものを　一つ　えらんで　ください。',
  ),
  midReading(
    section: ExamSection.grammarReading,
    number: 5,
    label: '内容理解（中文）',
    spanish: 'Texto medio',
    count: 2,
    area: ScoreArea.reading,
    instruction: 'もんだい５　つぎの　ぶんしょうを　読んで、しつもんに　こたえて　ください。'
        'こたえは、１・２・３・４から　いちばん　いい　ものを　一つ　えらんで　ください。',
  ),
  infoSearch(
    section: ExamSection.grammarReading,
    number: 6,
    label: '情報検索',
    spanish: 'Búsqueda de información',
    count: 1,
    area: ScoreArea.reading,
    instruction: 'もんだい６　つぎの　ページを　見て、下の　しつもんに　こたえて　ください。'
        'こたえは、１・２・３・４から　いちばん　いい　ものを　一つ　えらんで　ください。',
  ),
  taskListening(
    section: ExamSection.listening,
    number: 1,
    label: '課題理解',
    spanish: 'Comprensión de tareas',
    count: 7,
    area: ScoreArea.listening,
    instruction: 'もんだい１では、はじめに　しつもんを　きいて　ください。'
        'それから　はなしを　きいて、もんだいようしの　１から４の　なかから、'
        'いちばん　いい　ものを　ひとつ　えらんで　ください。',
  ),
  pointListening(
    section: ExamSection.listening,
    number: 2,
    label: 'ポイント理解',
    spanish: 'Comprensión de puntos clave',
    count: 6,
    area: ScoreArea.listening,
    instruction: 'もんだい２では、はじめに　しつもんを　きいて　ください。'
        'それから　はなしを　きいて、もんだいようしの　１から４の　なかから、'
        'いちばん　いい　ものを　ひとつ　えらんで　ください。',
  ),
  utterance(
    section: ExamSection.listening,
    number: 3,
    label: '発話表現',
    spanish: 'Expresión oral',
    count: 5,
    area: ScoreArea.listening,
    instruction: 'もんだい３では、えを　みながら　しつもんを　きいて　ください。'
        '➡（やじるし）の　ひとは　なんと　いいますか。'
        '１から３の　なかから、いちばん　いい　ものを　ひとつ　えらんで　ください。',
  ),
  quickResponse(
    section: ExamSection.listening,
    number: 4,
    label: '即時応答',
    spanish: 'Respuesta inmediata',
    count: 6,
    area: ScoreArea.listening,
    instruction: 'もんだい４は、えなどが　ありません。ぶんを　きいて、'
        '１から３の　なかから、いちばん　いい　ものを　ひとつ　えらんで　ください。',
  );

  final ExamSection section;

  /// Number of the もんだい inside its section.
  final int number;
  final String label;
  final String spanish;

  /// Items of this type in one test.
  final int count;
  final ScoreArea area;

  /// Official instructions printed in the test booklet.
  final String instruction;

  const Mondai({
    required this.section,
    required this.number,
    required this.label,
    required this.spanish,
    required this.count,
    required this.area,
    required this.instruction,
  });

  bool get isListening => section == ExamSection.listening;

  /// Listening types whose answer choices are only heard, not printed.
  bool get hasSpokenOptions =>
      this == Mondai.utterance || this == Mondai.quickResponse;

  /// Seconds to answer after the recording of one item ends.
  int get answerSeconds => switch (this) {
        Mondai.taskListening || Mondai.pointListening => 12,
        _ => 8,
      };
}

/// Text shared by several questions: a reading passage, a notice or the
/// passage with blanks of もんだい３.
class ExamPassage {
  final String id;
  final String text;

  const ExamPassage({required this.id, required this.text});
}

/// Recording of one listening item.
class ListeningClip {
  final String audioAsset;

  /// Who speaks and what, in order, shown as transcript when reviewing.
  final List<ScriptLine> script;

  /// Picture of the situation for 発話表現.
  final String? scene;

  const ListeningClip({
    required this.audioAsset,
    required this.script,
    this.scene,
  });
}

class ScriptLine {
  /// N narrator, M/M2 men, F/F2 women.
  final String speaker;
  final String text;

  const ScriptLine(this.speaker, this.text);

  String get speakerLabel => switch (speaker) {
        'N' => 'ナレーター',
        'M' => '男',
        'M2' => '男２',
        'F2' => '女２',
        _ => '女',
      };
}

class ExamQuestion {
  /// Bank item this question comes from. Questions sharing a passage have
  /// the passage id plus a suffix.
  final String itemId;
  final Mondai mondai;

  /// Number printed in the booklet: continuous within the written sections,
  /// restarting per もんだい in listening (１ばん, ２ばん…).
  final int number;
  final String stem;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final ExamPassage? passage;
  final ListeningClip? clip;

  /// For 文の組み立て: text before and after the four blanks, and which
  /// blank has the star (0-based).
  final String? orderBefore;
  final String? orderAfter;
  final int? starSlot;

  /// For 文の組み立て: the pieces in the right order, for the review.
  final List<String>? orderSolution;

  const ExamQuestion({
    required this.itemId,
    required this.mondai,
    required this.number,
    required this.stem,
    required this.options,
    required this.correctIndex,
    this.explanation = '',
    this.passage,
    this.clip,
    this.orderBefore,
    this.orderAfter,
    this.starSlot,
    this.orderSolution,
  });

  ExamQuestion copyWith({int? number}) {
    return ExamQuestion(
      itemId: itemId,
      mondai: mondai,
      number: number ?? this.number,
      stem: stem,
      options: options,
      correctIndex: correctIndex,
      explanation: explanation,
      passage: passage,
      clip: clip,
      orderBefore: orderBefore,
      orderAfter: orderAfter,
      starSlot: starSlot,
      orderSolution: orderSolution,
    );
  }
}

/// One generated test: the sections to sit, in order, with their questions.
class ExamPaper {
  final List<ExamSection> sections;
  final Map<ExamSection, List<ExamQuestion>> questions;

  const ExamPaper({required this.sections, required this.questions});

  bool get isFull => sections.length == ExamSection.values.length;

  List<ExamQuestion> get allQuestions =>
      [for (final s in sections) ...questions[s]!];
}
