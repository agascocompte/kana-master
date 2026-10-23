import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/domain/repositories/exam_repository.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/exam/bloc/exam_session_cubit.dart';
import 'package:kana_master/pages/exam/exam_result_page.dart';
import 'package:kana_master/pages/exam/widgets/exam_names.dart';
import 'package:kana_master/pages/exam/widgets/exam_question_view.dart';
import 'package:kana_master/pages/exam/widgets/jp_text.dart';
import 'package:kana_master/pages/exam/widgets/listening_runner.dart';
import 'package:kana_master/services/exam/exam_audio_player.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

/// Sits a generated test: the given sections in order, each with its
/// official time.
class ExamSessionPage extends StatefulWidget {
  final List<ExamSection> sections;
  final ExamRepository? repository;
  final ExamAudioPlayer Function()? playerFactory;

  const ExamSessionPage({
    super.key,
    required this.sections,
    this.repository,
    this.playerFactory,
  });

  @override
  State<ExamSessionPage> createState() => _ExamSessionPageState();
}

class _ExamSessionPageState extends State<ExamSessionPage> {
  late final ExamRepository _repository =
      widget.repository ?? sl<ExamRepository>();
  late final Future<ExamPaper> _paper =
      _repository.createPaper(widget.sections);

  @override
  void initState() {
    super.initState();
    // The listening runs for half an hour without touches; keep the screen
    // (and so the recording) from going to sleep during the whole test.
    WakelockPlus.enable().catchError((_) {});
  }

  @override
  void dispose() {
    WakelockPlus.disable().catchError((_) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExamPaper>(
      future: _paper,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(),
            body:
                Center(child: Text('${t.exam.createError}\n${snapshot.error}')),
          );
        }
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return BlocProvider(
          create: (_) => ExamSessionCubit(
            paper: snapshot.data!,
            repository: _repository,
          ),
          child: _ExamSessionView(
            playerFactory: widget.playerFactory ?? JustAudioExamPlayer.new,
          ),
        );
      },
    );
  }
}

class _ExamSessionView extends StatelessWidget {
  final ExamAudioPlayer Function() playerFactory;

  const _ExamSessionView({required this.playerFactory});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamSessionCubit, ExamSessionState>(
      builder: (context, state) {
        if (state.phase == ExamPhase.finished) {
          return ExamResultPage(
            args: ExamResultArgs(
              paper: state.paper,
              answers: state.answers,
              score: state.score!,
            ),
          );
        }
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop) _confirmLeave(context);
          },
          child: Scaffold(
            body: SafeArea(
              child: switch (state.phase) {
                ExamPhase.sectionIntro => _SectionIntro(state: state),
                ExamPhase.answering => state.section == ExamSection.listening
                    ? _ListeningSection(
                        state: state,
                        playerFactory: playerFactory,
                      )
                    : _WrittenSection(state: state),
                ExamPhase.finished => const SizedBox.shrink(),
              },
            ),
          ),
        );
      },
    );
  }
}

Future<void> _confirmLeave(BuildContext context) async {
  final leave = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(t.exam.leaveTitle),
      content: Text(t.exam.leaveBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(t.exam.keepGoing),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(t.exam.leave, style: TextStyle(color: AppColors.coral)),
        ),
      ],
    ),
  );
  if (leave == true && context.mounted) context.pop();
}

class _SectionIntro extends StatelessWidget {
  final ExamSessionState state;

  const _SectionIntro({required this.state});

  @override
  Widget build(BuildContext context) {
    final section = state.section;
    final isListening = section == ExamSection.listening;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () => _confirmLeave(context),
            icon: const Icon(Icons.close),
            tooltip: t.exam.leave,
          ),
        ),
        if (state.paper.sections.length > 1)
          Text(
            t.exam.sectionOf(
              current: state.sectionIndex + 1,
              total: state.paper.sections.length,
            ),
            style: TextStyle(color: AppColors.slate, fontSize: 14),
          ),
        const SizedBox(height: 4),
        Text('N5',
            style: JpText.style(fontSize: 18, fontWeight: FontWeight.w800)),
        Text(
          section.title,
          style: JpText.style(fontSize: 26, fontWeight: FontWeight.w800),
        ),
        Text(section.localName, style: TextStyle(color: AppColors.slate)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.exam.sectionInfo(
                  minutes: section.minutes,
                  count: state.questions.length,
                ),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 10),
              for (final mondai in section.mondai)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 86,
                        child: Text(
                          'もんだい${mondai.number}',
                          style: JpText.style(fontSize: 14),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${mondai.localName} (${mondai.count})',
                          style: TextStyle(color: AppColors.graphite),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              Text(
                isListening ? t.exam.listeningIntro : t.exam.writtenIntro,
                style: TextStyle(color: AppColors.slate, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () => context.read<ExamSessionCubit>().startSection(),
          icon: const Icon(Icons.play_arrow),
          label: Text(t.exam.start),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
          ),
        ),
      ],
    );
  }
}

class _WrittenSection extends StatefulWidget {
  final ExamSessionState state;

  const _WrittenSection({required this.state});

  @override
  State<_WrittenSection> createState() => _WrittenSectionState();
}

class _WrittenSectionState extends State<_WrittenSection> {
  Timer? _ticker;
  final ScrollController _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      final cubit = context.read<ExamSessionCubit>();
      if (cubit.timeIsUp) {
        _ticker?.cancel();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.exam.timeUp)),
        );
        cubit.finishSection();
      } else {
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(covariant _WrittenSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state.questionIndex != widget.state.questionIndex &&
        _scroll.hasClients) {
      _scroll.jumpTo(0);
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final state = widget.state;
    final unanswered = state.unansweredInSection;
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.exam.submitTitle),
        content: Text(unanswered == 0
            ? t.exam.submitAllAnswered
            : t.exam.submitUnanswered(count: unanswered)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.exam.keepGoing),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(t.exam.submit),
          ),
        ],
      ),
    );
    if (ok == true && mounted) {
      await context.read<ExamSessionCubit>().finishSection();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final cubit = context.read<ExamSessionCubit>();
    final remaining = cubit.remaining;
    final q = state.question;
    final low = remaining.inMinutes < 3;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 8, 0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => _confirmLeave(context),
                icon: const Icon(Icons.close),
                tooltip: t.exam.leave,
              ),
              Expanded(
                child: Text(
                  state.section.title,
                  overflow: TextOverflow.ellipsis,
                  style:
                      JpText.style(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
              Icon(Icons.timer_outlined,
                  size: 18, color: low ? AppColors.coral : AppColors.slate),
              const SizedBox(width: 4),
              Text(
                _format(remaining),
                style: TextStyle(
                  fontFeatures: const [FontFeature.tabularFigures()],
                  fontWeight: FontWeight.w800,
                  color: low ? AppColors.coral : AppColors.ink,
                ),
              ),
              const SizedBox(width: 8),
              TextButton(onPressed: _submit, child: Text(t.exam.submit)),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            controller: _scroll,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            children: [
              ExamQuestionView(
                question: q,
                sectionQuestions: state.questions,
                selected: state.answers[q],
                onSelect: (i) => cubit.answer(q, i),
              ),
            ],
          ),
        ),
        _QuestionNavigator(state: state),
      ],
    );
  }

  static String _format(Duration d) {
    final m = d.inMinutes.toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}

class _QuestionNavigator extends StatelessWidget {
  final ExamSessionState state;

  const _QuestionNavigator({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamSessionCubit>();
    final isFirst = state.questionIndex == 0;
    final isLast = state.questionIndex == state.questions.length - 1;
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.sand)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: isFirst ? null : cubit.previous,
            icon: const Icon(Icons.chevron_left),
            tooltip: t.exam.previous,
          ),
          Expanded(
            child: TextButton.icon(
              onPressed: () => _showGrid(context),
              icon: const Icon(Icons.grid_view, size: 18),
              label: Text(
                t.exam.questionOf(
                  current: state.questionIndex + 1,
                  total: state.questions.length,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: isLast ? null : cubit.next,
            icon: const Icon(Icons.chevron_right),
            tooltip: t.exam.next,
          ),
        ],
      ),
    );
  }

  void _showGrid(BuildContext context) {
    final cubit = context.read<ExamSessionCubit>();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      builder: (sheetContext) {
        final state = cubit.state;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var i = 0; i < state.questions.length; i++)
                  _GridCell(
                    label: '${state.questions[i].number}',
                    answered: state.answers.containsKey(state.questions[i]),
                    current: i == state.questionIndex,
                    onTap: () {
                      cubit.goTo(i);
                      Navigator.pop(sheetContext);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _GridCell extends StatelessWidget {
  final String label;
  final bool answered;
  final bool current;
  final VoidCallback onTap;

  const _GridCell({
    required this.label,
    required this.answered,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 44,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: answered ? AppColors.teal : AppColors.mist,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: current ? AppColors.ink : AppColors.sand,
            width: current ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: answered ? Colors.white : AppColors.ink,
          ),
        ),
      ),
    );
  }
}

class _ListeningSection extends StatefulWidget {
  final ExamSessionState state;
  final ExamAudioPlayer Function() playerFactory;

  const _ListeningSection({required this.state, required this.playerFactory});

  @override
  State<_ListeningSection> createState() => _ListeningSectionState();
}

class _ListeningSectionState extends State<_ListeningSection> {
  late final ExamAudioPlayer _player = widget.playerFactory();

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamSessionCubit>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 8, 0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => _confirmLeave(context),
                icon: const Icon(Icons.close),
                tooltip: t.exam.leave,
              ),
              Expanded(
                child: Text(
                  widget.state.section.title,
                  style:
                      JpText.style(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            children: [
              ListeningRunner(
                questions: widget.state.questions,
                answers: widget.state.answers,
                onAnswer: cubit.answer,
                onFinished: cubit.finishSection,
                player: _player,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
