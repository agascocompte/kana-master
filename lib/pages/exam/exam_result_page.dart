import 'package:flutter/material.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/domain/exam/exam_scoring.dart';
import 'package:kana_master/pages/exam/exam_review_page.dart';
import 'package:kana_master/pages/exam/widgets/jp_text.dart';
import 'package:kana_master/theme/app_theme.dart';

class ExamResultArgs {
  final ExamPaper paper;
  final Map<ExamQuestion, int> answers;
  final ExamScore score;

  const ExamResultArgs({
    required this.paper,
    required this.answers,
    required this.score,
  });
}

class ExamResultPage extends StatelessWidget {
  final ExamResultArgs args;

  const ExamResultPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    final score = args.score;
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        children: [
          ScoreSummaryCard(score: score, sections: args.paper.sections),
          const SizedBox(height: 16),
          for (final section in args.paper.sections) ...[
            Text(
              section.title,
              style: JpText.style(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            for (final mondai in section.mondai)
              if (score.byMondai[mondai] != null)
                MondaiRow(mondai: mondai, tally: score.byMondai[mondai]!),
            const SizedBox(height: 12),
          ],
          FilledButton.icon(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ExamReviewPage(args: args),
            )),
            icon: const Icon(Icons.fact_check_outlined),
            label: const Text('Revisar respuestas'),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text('Volver'),
          ),
        ],
      ),
    );
  }
}

/// Scores on the official scale for a whole test, or the share of right
/// answers when only some sections were sat.
class ScoreSummaryCard extends StatelessWidget {
  final ExamScore score;
  final List<ExamSection> sections;

  const ScoreSummaryCard({
    super.key,
    required this.score,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    final full = sections.length == ExamSection.values.length;
    final passed = score.passed;
    final Color accent =
        full ? (passed ? AppColors.teal : AppColors.coral) : AppColors.sky;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (full) ...[
            Text(
              passed ? '合格 · Aprobado' : '不合格 · Suspenso',
              style: JpText.style(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: accent,
              ),
            ),
            const SizedBox(height: 12),
            _ScoreLine(
              label: '言語知識（文字・語彙・文法）・読解',
              points: score.languagePoints,
              max: ExamScore.languageMax,
              minimum: ExamScore.passLanguage,
            ),
            _ScoreLine(
              label: '聴解',
              points: score.listeningPoints,
              max: ExamScore.listeningMax,
              minimum: ExamScore.passListening,
            ),
            const Divider(height: 20),
            _ScoreLine(
              label: '総合得点',
              points: score.totalPoints,
              max: ExamScore.totalMax,
              minimum: ExamScore.passTotal,
              bold: true,
            ),
            const SizedBox(height: 8),
            Text(
              'Puntuación estimada: cada pregunta vale lo mismo. Para aprobar '
              'hacen falta 80/180 y un mínimo de 38 y 19 en cada parte.',
              style: TextStyle(color: AppColors.slate, fontSize: 12),
            ),
          ] else ...[
            Text(
              '${(score.overall.ratio * 100).round()} %',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                color: AppColors.ink,
              ),
            ),
            Text(
              '${score.overall.correct} de ${score.overall.total} correctas',
              style: TextStyle(color: AppColors.slate),
            ),
            const SizedBox(height: 8),
            Text(
              _partialHint(),
              style: TextStyle(color: AppColors.slate, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }

  String _partialHint() {
    // Share of right answers that reaches the minimum score of the section.
    if (sections.contains(ExamSection.listening)) {
      return 'Mínimo para no suspender el listening: 19/60 (32 %). '
          'Para ir con margen, apunta a más del 60 %.';
    }
    return 'Mínimo de la parte de lenguaje: 38/120 (32 %). '
        'Para ir con margen, apunta a más del 60 %.';
  }
}

class _ScoreLine extends StatelessWidget {
  final String label;
  final int points;
  final int max;
  final int minimum;
  final bool bold;

  const _ScoreLine({
    required this.label,
    required this.points,
    required this.max,
    required this.minimum,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final ok = points >= minimum;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: JpText.style(
                fontSize: 14,
                fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
              ),
            ),
          ),
          Text(
            '$points',
            style: TextStyle(
              fontSize: bold ? 22 : 18,
              fontWeight: FontWeight.w900,
              color: ok ? AppColors.ink : AppColors.coral,
            ),
          ),
          Text(' / $max', style: TextStyle(color: AppColors.slate)),
        ],
      ),
    );
  }
}

/// Right answers of one もんだい, with a bar.
class MondaiRow extends StatelessWidget {
  final Mondai mondai;
  final Tally tally;

  /// Shows the share of right answers instead of the count.
  final bool percent;

  const MondaiRow({
    super.key,
    required this.mondai,
    required this.tally,
    this.percent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'もんだい${mondai.number}　${mondai.label}',
                  style: JpText.style(fontSize: 13, fontWeight: FontWeight.w700)
                      .copyWith(height: 1.3),
                ),
                Text(
                  mondai.spanish,
                  style: TextStyle(color: AppColors.slate, fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: tally.ratio,
                minHeight: 8,
                color: tally.ratio >= 0.6 ? AppColors.teal : AppColors.coral,
                backgroundColor: AppColors.sand,
              ),
            ),
          ),
          SizedBox(
            width: 48,
            child: Text(
              percent
                  ? '${(tally.ratio * 100).round()} %'
                  : '${tally.correct}/${tally.total}',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
