import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/domain/exam/exam_scoring.dart';
import 'package:kana_master/domain/repositories/exam_repository.dart';
import 'package:kana_master/domain/repositories/settings_repository.dart';
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
    final today = DateUtils.dateOnly(DateTime.now());
    final daysLeft = _examDate?.difference(today).inDays;
    final todayCount = _results
        .where((r) => DateUtils.isSameDay(r.timestamp, DateTime.now()))
        .length;
    return Scaffold(
      appBar: AppBar(title: const Text('Simulador JLPT N5')),
      body: RefreshIndicator(
        onRefresh: _load,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _InfoTile(
                      value: daysLeft == null ? '–' : '$daysLeft',
                      label: daysLeft == 1
                          ? 'día para el examen'
                          : 'días para el examen',
                      onTap: _pickDate,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _InfoTile(
                      value: '$todayCount',
                      label: todayCount == 1 ? 'examen hoy' : 'exámenes hoy',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _InfoTile(
                      value: '${_coverage.$1}/${_coverage.$2}',
                      label: 'preguntas vistas',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ActionCard(
              title: 'Examen completo',
              subtitle: '20 + 40 + 30 min · 67 preguntas · formato oficial',
              icon: Icons.assignment_outlined,
              gradient:
                  LinearGradient(colors: [AppColors.peach, AppColors.coral]),
              onTap: () => _start(ExamSection.values),
            ),
            const SizedBox(height: 12),
            ActionCard(
              title: 'Vocabulario',
              subtitle: '文字・語彙 · 20 min · 21 preguntas',
              icon: Icons.translate,
              gradient:
                  LinearGradient(colors: [AppColors.lime, AppColors.teal]),
              onTap: () => _start([ExamSection.vocabulary]),
            ),
            const SizedBox(height: 12),
            ActionCard(
              title: 'Gramática y lectura',
              subtitle: '文法・読解 · 40 min · 22 preguntas',
              icon: Icons.menu_book_outlined,
              gradient: LinearGradient(colors: [AppColors.teal, AppColors.sky]),
              onTap: () => _start([ExamSection.grammarReading]),
            ),
            const SizedBox(height: 12),
            ActionCard(
              title: 'Listening',
              subtitle: '聴解 · 30 min · 24 preguntas',
              icon: Icons.headphones_outlined,
              gradient:
                  LinearGradient(colors: [AppColors.sky, AppColors.peach]),
              onTap: () => _start([ExamSection.listening]),
            ),
            const SizedBox(height: 20),
            if (_results.where((r) => r.isFull).length >= 2) ...[
              Text(
                'Evolución (examen completo)',
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
            if (_results.isNotEmpty)
              Text(
                'Historial',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                ),
              ),
            const SizedBox(height: 6),
            for (final result in _results.take(30)) _ResultTile(result: result),
          ],
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

  const _ResultTile({required this.result});

  @override
  Widget build(BuildContext context) {
    final score = result.score;
    final String title = result.isFull
        ? 'Examen completo'
        : result.sections.map((s) => s.subtitle).join(' + ');
    final String value = result.isFull
        ? '${score.totalPoints}/${ExamScore.totalMax}'
        : '${(score.overall.ratio * 100).round()} %';
    final Color color = result.isFull
        ? (score.passed ? AppColors.teal : AppColors.coral)
        : (score.overall.ratio >= 0.6 ? AppColors.teal : AppColors.coral);
    final t = result.timestamp;
    final date =
        '${t.day}/${t.month} ${t.hour}:${t.minute.toString().padLeft(2, '0')}';
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(
          result.isFull
              ? '$date · Lenguaje ${score.languagePoints}/120 · '
                  'Listening ${score.listeningPoints}/60'
              : '$date · ${score.overall.correct}/${score.overall.total}',
        ),
        trailing: Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: color,
          ),
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
