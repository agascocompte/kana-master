import 'package:flutter/material.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/exam/exam_result_page.dart';
import 'package:kana_master/pages/exam/widgets/exam_option_tile.dart';
import 'package:kana_master/pages/exam/widgets/exam_question_view.dart';
import 'package:kana_master/pages/exam/widgets/jp_text.dart';
import 'package:kana_master/pages/exam/widgets/listening_runner.dart';
import 'package:kana_master/services/exam/exam_audio_player.dart';
import 'package:kana_master/theme/app_theme.dart';

/// Every question of a finished test with the right answer, the
/// explanation and, for listening, the transcript and the recording.
class ExamReviewPage extends StatefulWidget {
  final ExamResultArgs args;
  final ExamAudioPlayer Function()? playerFactory;

  const ExamReviewPage({super.key, required this.args, this.playerFactory});

  @override
  State<ExamReviewPage> createState() => _ExamReviewPageState();
}

class _ExamReviewPageState extends State<ExamReviewPage> {
  late final ExamAudioPlayer _player =
      (widget.playerFactory ?? JustAudioExamPlayer.new)();
  bool _onlyMistakes = true;
  String? _playing;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _toggleAudio(ExamQuestion q) async {
    final asset = q.clip!.audioAsset;
    if (_playing == asset) {
      await _player.stop();
      return;
    }
    setState(() => _playing = asset);
    await _player.play(asset);
    if (mounted && _playing == asset) setState(() => _playing = null);
  }

  @override
  Widget build(BuildContext context) {
    final paper = widget.args.paper;
    final answers = widget.args.answers;
    final children = <Widget>[];
    for (final section in paper.sections) {
      final questions = paper.questions[section]!;
      final shown = questions
          .where((q) => !_onlyMistakes || answers[q] != q.correctIndex)
          .toList();
      if (shown.isEmpty) continue;
      children.add(Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          section.title,
          style: JpText.style(fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ));
      for (final q in shown) {
        children.add(q.clip == null
            ? ExamQuestionView(
                question: q,
                sectionQuestions: questions,
                selected: answers[q],
                review: true,
              )
            : _ListeningReview(
                question: q,
                selected: answers[q],
                playing: _playing == q.clip!.audioAsset,
                onPlay: () => _toggleAudio(q),
              ));
        children.add(const Divider(height: 32));
      }
    }
    if (children.isEmpty) {
      children.add(Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Text(
            t.exam.noMistakes,
            style: TextStyle(fontSize: 18, color: AppColors.slate),
          ),
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(t.exam.reviewTitle),
        actions: [
          Row(
            children: [
              Text(t.exam.onlyMistakes, style: TextStyle(color: AppColors.ink)),
              Switch(
                value: _onlyMistakes,
                onChanged: (v) => setState(() => _onlyMistakes = v),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        children: children,
      ),
    );
  }
}

class _ListeningReview extends StatelessWidget {
  final ExamQuestion question;
  final int? selected;
  final bool playing;
  final VoidCallback onPlay;

  const _ListeningReview({
    required this.question,
    required this.selected,
    required this.playing,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    final q = question;
    OptionMark mark(int i) {
      if (i == q.correctIndex) return OptionMark.correct;
      if (i == selected) return OptionMark.wrong;
      return OptionMark.none;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'もんだい${q.mondai.number}　${q.number}ばん',
                style: JpText.style(fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ),
            IconButton.filledTonal(
              onPressed: onPlay,
              icon: Icon(playing ? Icons.stop : Icons.play_arrow),
              tooltip: playing ? t.exam.stop : t.exam.listen,
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (q.clip!.scene != null) ...[
          SceneCard(scene: q.clip!.scene!),
          const SizedBox(height: 10),
        ],
        for (var i = 0; i < q.options.length; i++)
          ExamOptionTile(index: i, text: q.options[i], mark: mark(i)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.sand.withAlpha(120),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final line in q.clip!.script)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: JpText(
                    line.speaker == 'N'
                        ? line.text
                        : '${line.speakerLabel}：${line.text}',
                    fontSize: 15,
                    color:
                        line.speaker == 'N' ? AppColors.slate : AppColors.ink,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ReviewNote(question: q, selected: selected),
      ],
    );
  }
}
