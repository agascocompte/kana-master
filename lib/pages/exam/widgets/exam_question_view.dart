import 'package:flutter/material.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/exam/widgets/exam_option_tile.dart';
import 'package:kana_master/pages/exam/widgets/jp_text.dart';
import 'package:kana_master/pages/exam/widgets/passage_card.dart';
import 'package:kana_master/theme/app_theme.dart';

/// Booklet instructions of [mondai], with the blank numbers of もんだい３
/// filled in from [sectionQuestions].
String mondaiInstruction(Mondai mondai, List<ExamQuestion> sectionQuestions) {
  if (mondai != Mondai.textGrammar) return mondai.instruction;
  final numbers = sectionQuestions
      .where((q) => q.mondai == Mondai.textGrammar)
      .map((q) => q.number)
      .toList();
  if (numbers.isEmpty) return mondai.instruction;
  return mondai.instruction
      .replaceAll('FIRST', '${numbers.first}')
      .replaceAll('LAST', '${numbers.last}');
}

class InstructionBox extends StatelessWidget {
  final String text;

  const InstructionBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.sand.withAlpha(140),
        borderRadius: BorderRadius.circular(12),
      ),
      child: JpText(text, fontSize: 14, color: AppColors.graphite),
    );
  }
}

/// A question of the written sections, while answering or when reviewing.
class ExamQuestionView extends StatelessWidget {
  final ExamQuestion question;
  final List<ExamQuestion> sectionQuestions;
  final int? selected;
  final ValueChanged<int>? onSelect;
  final bool review;

  const ExamQuestionView({
    super.key,
    required this.question,
    required this.sectionQuestions,
    this.selected,
    this.onSelect,
    this.review = false,
  });

  @override
  Widget build(BuildContext context) {
    final q = question;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InstructionBox(text: mondaiInstruction(q.mondai, sectionQuestions)),
        const SizedBox(height: 14),
        if (q.passage != null) ...[
          PassageCard(text: q.passage!.text),
          const SizedBox(height: 14),
        ],
        _Stem(question: q),
        const SizedBox(height: 14),
        for (var i = 0; i < q.options.length; i++)
          ExamOptionTile(
            index: i,
            text: q.options[i],
            mark: _mark(i),
            onTap: onSelect == null ? null : () => onSelect!(i),
          ),
        if (review) ...[
          const SizedBox(height: 6),
          ReviewNote(question: q, selected: selected),
        ],
      ],
    );
  }

  OptionMark _mark(int i) {
    if (!review) return i == selected ? OptionMark.selected : OptionMark.none;
    if (i == question.correctIndex) return OptionMark.correct;
    if (i == selected) return OptionMark.wrong;
    return OptionMark.none;
  }
}

class _Stem extends StatelessWidget {
  final ExamQuestion question;

  const _Stem({required this.question});

  @override
  Widget build(BuildContext context) {
    final q = question;
    final number = Text(
      '${q.number}',
      style: JpText.style(fontSize: 18, fontWeight: FontWeight.w800),
    );
    Widget body;
    if (q.mondai == Mondai.sentenceOrder) {
      final blanks = [
        for (var i = 0; i < 4; i++) i == q.starSlot ? '＿★＿' : '＿＿＿',
      ];
      body = JpText(
        [q.orderBefore ?? '', ...blanks, q.orderAfter ?? '']
            .where((s) => s.isNotEmpty)
            .join(' '),
        fontSize: 19,
      );
    } else if (q.mondai == Mondai.textGrammar) {
      // The booklet lists only the blank number and its choices.
      body = const SizedBox(height: 34);
    } else {
      body = JpText(q.stem, fontSize: 19);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 10, top: 2),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.ink, width: 1.4),
          ),
          child: number,
        ),
        Expanded(child: body),
      ],
    );
  }
}

/// Explanation shown under a reviewed question.
class ReviewNote extends StatelessWidget {
  final ExamQuestion question;
  final int? selected;

  const ReviewNote({super.key, required this.question, this.selected});

  @override
  Widget build(BuildContext context) {
    final q = question;
    final right = selected == q.correctIndex;
    final lines = <Widget>[
      Text(
        selected == null
            ? t.exam.unanswered
            : right
                ? t.exam.correct
                : t.exam.incorrect,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: right ? AppColors.teal : AppColors.coral,
        ),
      ),
    ];
    if (q.orderSolution != null) {
      lines.add(const SizedBox(height: 6));
      lines.add(JpText(
        [q.orderBefore ?? '', ...q.orderSolution!, q.orderAfter ?? '']
            .where((s) => s.isNotEmpty)
            .join(' '),
        fontSize: 16,
      ));
    }
    if (q.explanation.isNotEmpty) {
      lines.add(const SizedBox(height: 6));
      lines.add(Text(
        q.explanation,
        style: TextStyle(
          locale: JpText.japanese,
          color: AppColors.graphite,
          fontSize: 15,
          height: 1.5,
        ),
      ));
    }
    if (q.translation != null) {
      lines.add(const SizedBox(height: 10));
      lines.add(Text(
        t.exam.translation,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: AppColors.ink,
          fontSize: 13,
        ),
      ));
      lines.add(const SizedBox(height: 2));
      lines.add(Text(
        q.translation!,
        style: TextStyle(color: AppColors.graphite, fontSize: 15, height: 1.5),
      ));
    }
    if (q.passage?.translation != null) {
      lines.add(_PassageTranslation(text: q.passage!.translation!));
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: lines,
      ),
    );
  }
}

/// Translation of a reading passage, folded until asked for.
class _PassageTranslation extends StatefulWidget {
  final String text;

  const _PassageTranslation({required this.text});

  @override
  State<_PassageTranslation> createState() => _PassageTranslationState();
}

class _PassageTranslationState extends State<_PassageTranslation> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () => setState(() => _open = !_open),
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          icon: Icon(_open ? Icons.expand_less : Icons.expand_more),
          label: Text(
            _open ? t.exam.hideTextTranslation : t.exam.showTextTranslation,
          ),
        ),
        if (_open)
          Text(
            widget.text,
            style: TextStyle(
              color: AppColors.graphite,
              fontSize: 15,
              height: 1.5,
            ),
          ),
      ],
    );
  }
}
