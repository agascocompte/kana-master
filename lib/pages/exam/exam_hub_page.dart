import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/domain/exam/exam_scoring.dart';
import 'package:kana_master/domain/repositories/exam_repository.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/exam/exam_result_page.dart';
import 'package:kana_master/pages/exam/widgets/exam_names.dart';
import 'package:kana_master/pages/study/widgets/action_card.dart';
import 'package:kana_master/router/router.dart';
import 'package:kana_master/theme/app_theme.dart';

/// Start page of the N5 practice tests: full test or one section, with the
/// days left and past results.
///
/// Texts are Spanish only while the simulator is a personal tool.
class ExamHubPage extends StatefulWidget {
  const ExamHubPage({super.key});

  @override
  State<ExamHubPage> createState() => _ExamHubPageState();
}

class _ExamHubPageState extends State<ExamHubPage> {
  final ExamRepository _repository = sl<ExamRepository>();
  final SettingsRepository _settings = sl<SettingsRepository>();
  List<ExamResultRecord> _results = const [];
  (int, int) _coverage = (0, 0);
  DateTime? _examDate;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final results = await _repository.getResults();
    final coverage = await _repository.getCoverage();
    final examDate = await _settings.getExamDate();
    if (!mounted) return;
    setState(() {
      _results = results;
      _coverage = coverage;
      _examDate = examDate;
    });
  }

  Future<void> _start(List<ExamSection> sections) async {
    await context.push(AppRouter.examSessionRoute, extra: sections);
    _load();
  }

  /// Tests the weak points are computed from.
  int get _recentCount => _results.length < 10 ? _results.length : 10;

  /// The もんだい with the lowest share of right answers in recent tests,
  /// weakest first. Types asked fewer than five times are left out.
  List<MapEntry<Mondai, Tally>> get _weakPoints {
    final totals = <Mondai, Tally>{};
    for (final result in _results.take(_recentCount)) {
      for (final entry in result.score.byMondai.entries) {
        totals[entry.key] =
            (totals[entry.key] ?? const Tally(0, 0)) + entry.value;
      }
    }
    final ranked = totals.entries.where((e) => e.value.total >= 5).toList()
      ..sort((a, b) => a.value.ratio.compareTo(b.value.ratio));
    return ranked.take(5).toList();
  }

  Future<void> _openResult(ExamResultRecord result) async {
    final review = await _repository.getReview(result.id);
    if (!mounted || review == null) return;
    final (paper, answers) = review;
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => ExamResultPage(
        args: ExamResultArgs(
          paper: paper,
          answers: answers,
          score: result.score,
        ),
      ),
    ));
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _examDate ?? now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 2),
    );
    if (picked == null) return;
    await _settings.saveExamDate(picked);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    // Rebuilds the tab when the language of the app changes.
    final t = context.t;
    final today = DateUtils.dateOnly(DateTime.now());
    final daysLeft = _examDate?.difference(today).inDays;
    final todayCount = _results
        .where((r) => DateUtils.isSameDay(r.timestamp, DateTime.now()))
        .length;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: _load,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
            children: [
              Text(
                t.exam.hubTitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                t.exam.hubSubtitle,
                style: TextStyle(color: AppColors.slate, fontSize: 14),
              ),
              const SizedBox(height: 18),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _InfoTile(
                        value: daysLeft == null ? '–' : '$daysLeft',
                        label: t.exam.daysLeft,
                        onTap: _pickDate,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _InfoTile(
                        value: '$todayCount',
                        label: t.exam.examsToday,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _InfoTile(
                        value: '${_coverage.$1}/${_coverage.$2}',
                        label: t.exam.questionsSeen,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ActionCard(
                title: t.exam.fullExam,
                subtitle: t.exam.fullExamSubtitle,
                icon: Icons.assignment_outlined,
                gradient:
                    LinearGradient(colors: [AppColors.peach, AppColors.coral]),
                onTap: () => _start(ExamSection.values),
              ),
              const SizedBox(height: 12),
              ActionCard(
                title: ExamSection.vocabulary.localName,
                subtitle:
                    '文字・語彙 · ${t.exam.sectionCardSubtitle(minutes: 20, count: 21)}',
                icon: Icons.translate,
                gradient:
                    LinearGradient(colors: [AppColors.lime, AppColors.teal]),
                onTap: () => _start([ExamSection.vocabulary]),
              ),
              const SizedBox(height: 12),
              ActionCard(
                title: ExamSection.grammarReading.localName,
                subtitle:
                    '文法・読解 · ${t.exam.sectionCardSubtitle(minutes: 40, count: 22)}',
                icon: Icons.menu_book_outlined,
                gradient:
                    LinearGradient(colors: [AppColors.teal, AppColors.sky]),
                onTap: () => _start([ExamSection.grammarReading]),
              ),
              const SizedBox(height: 12),
              ActionCard(
                title: ExamSection.listening.localName,
                subtitle:
                    '聴解 · ${t.exam.sectionCardSubtitle(minutes: 30, count: 24)}',
                icon: Icons.headphones_outlined,
                gradient:
                    LinearGradient(colors: [AppColors.sky, AppColors.peach]),
                onTap: () => _start([ExamSection.listening]),
              ),
              const SizedBox(height: 20),
              if (_results.where((r) => r.isFull).length >= 2) ...[
                Text(
                  t.exam.progressTitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 180,
                  child: _ScoreChart(
                    results: _results.where((r) => r.isFull).toList(),
                  ),
                ),
                const SizedBox(height: 20),
              ],
              if (_weakPoints.isNotEmpty) ...[
                Text(
                  t.exam.weakPoints,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
                Text(
                  t.exam.weakPointsSubtitle(count: _recentCount),
                  style: TextStyle(color: AppColors.slate, fontSize: 13),
                ),
                const SizedBox(height: 6),
                for (final entry in _weakPoints)
                  MondaiRow(
                      mondai: entry.key, tally: entry.value, percent: true),
                const SizedBox(height: 20),
              ],
              if (_results.isNotEmpty)
                Text(
                  t.exam.history,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.ink,
                  ),
                ),
              const SizedBox(height: 6),
              for (final result in _results.take(30))
                _ResultTile(
                  result: result,
                  onTap: result.canReview ? () => _openResult(result) : null,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String value;
  final String label;
  final VoidCallback? onTap;

  const _InfoTile({required this.value, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: AppColors.ink,
                  ),
                ),
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.slate, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultTile extends StatelessWidget {
  final ExamResultRecord result;
  final VoidCallback? onTap;

  const _ResultTile({required this.result, this.onTap});

  @override
  Widget build(BuildContext context) {
    final score = result.score;
    final String title = result.isFull
        ? t.exam.fullExam
        : result.sections.map((s) => s.localName).join(' + ');
    final String value = result.isFull
        ? '${score.totalPoints}/${ExamScore.totalMax}'
        : '${(score.overall.ratio * 100).round()} %';
    final Color color = result.isFull
        ? (score.passed ? AppColors.teal : AppColors.coral)
        : (score.overall.ratio >= 0.6 ? AppColors.teal : AppColors.coral);
    final time = result.timestamp;
    final date =
        '${time.day}/${time.month} ${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: onTap,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(
          result.isFull
              ? t.exam.historyFullDetail(
                  date: date,
                  language: score.languagePoints,
                  listening: score.listeningPoints,
                )
              : '$date · ${score.overall.correct}/${score.overall.total}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
            if (onTap != null)
              Icon(Icons.chevron_right, color: AppColors.slate),
          ],
        ),
      ),
    );
  }
}

class _ScoreChart extends StatelessWidget {
  /// Full tests, newest first.
  final List<ExamResultRecord> results;

  const _ScoreChart({required this.results});

  @override
  Widget build(BuildContext context) {
    final ordered = results.reversed.toList();
    final spots = [
      for (var i = 0; i < ordered.length; i++)
        FlSpot(i.toDouble(), ordered[i].score.totalPoints.toDouble()),
    ];
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: ExamScore.totalMax.toDouble(),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 20,
          getDrawingHorizontalLine: (value) => FlLine(
            color:
                value == ExamScore.passTotal ? AppColors.coral : AppColors.sand,
            strokeWidth: value == ExamScore.passTotal ? 2 : 1,
          ),
        ),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          bottomTitles: const AxisTitles(),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 40,
              reservedSize: 32,
              getTitlesWidget: (value, meta) => Text(
                value.toInt().toString(),
                style: TextStyle(color: AppColors.slate, fontSize: 11),
              ),
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => AppColors.surface,
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            color: AppColors.teal,
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.teal.withAlpha(60),
            ),
          ),
        ],
      ),
    );
  }
}
