import 'package:flutter/material.dart';
import 'package:kana_master/domain/exam/exam_bank.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/pages/exam/widgets/exam_option_tile.dart';
import 'package:kana_master/pages/exam/widgets/exam_question_view.dart';
import 'package:kana_master/pages/exam/widgets/jp_text.dart';
import 'package:kana_master/services/exam/exam_audio_player.dart';
import 'package:kana_master/theme/app_theme.dart';

enum _Step { instruction, listening, answering }

/// Runs the listening section like the real recording: the instructions of
/// each もんだい, then every item once, with a fixed time to answer after
/// it. Nothing can be replayed.
class ListeningRunner extends StatefulWidget {
  final List<ExamQuestion> questions;
  final Map<ExamQuestion, int> answers;
  final void Function(ExamQuestion question, int option) onAnswer;
  final VoidCallback onFinished;
  final ExamAudioPlayer player;

  const ListeningRunner({
    super.key,
    required this.questions,
    required this.answers,
    required this.onAnswer,
    required this.onFinished,
    required this.player,
  });

  @override
  State<ListeningRunner> createState() => _ListeningRunnerState();
}

class _ListeningRunnerState extends State<ListeningRunner> {
  _Step _step = _Step.instruction;
  int _index = 0;
  int _secondsLeft = 0;
  bool _paused = false;
  bool _disposed = false;

  ExamQuestion get _question => widget.questions[_index];

  @override
  void initState() {
    super.initState();
    _run();
  }

  @override
  void dispose() {
    _disposed = true;
    widget.player.stop();
    super.dispose();
  }

  Future<void> _run() async {
    Mondai? mondai;
    for (var i = 0; i < widget.questions.length; i++) {
      final q = widget.questions[i];
      if (q.mondai != mondai) {
        mondai = q.mondai;
        _set(() {
          _index = i;
          _step = _Step.instruction;
        });
        await _play(examAudioAsset('inst_${mondai.name}'));
      }
      _set(() {
        _index = i;
        _step = _Step.listening;
      });
      await _play(examAudioAsset('num_${q.number}'));
      await _play(q.clip!.audioAsset);
      _set(() {
        _step = _Step.answering;
        _secondsLeft = q.mondai.answerSeconds;
      });
      while (_secondsLeft > 0) {
        await _wait(const Duration(seconds: 1));
        if (_disposed) return;
        _set(() => _secondsLeft--);
      }
    }
    if (!_disposed) widget.onFinished();
  }

  Future<void> _play(String asset) async {
    if (_disposed) return;
    await _waitWhilePaused();
    if (_disposed) return;
    await widget.player.play(asset);
  }

  /// Waits [duration] of unpaused time.
  Future<void> _wait(Duration duration) async {
    await _waitWhilePaused();
    await Future<void>.delayed(duration);
    await _waitWhilePaused();
  }

  Future<void> _waitWhilePaused() async {
    while (_paused && !_disposed) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
  }

  void _set(VoidCallback change) {
    if (_disposed || !mounted) return;
    setState(change);
  }

  void _togglePause() {
    setState(() => _paused = !_paused);
    if (_paused) {
      widget.player.pause();
    } else {
      widget.player.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = _question;
    final selected = widget.answers[q];
    final String status = switch (_step) {
      _Step.instruction => 'Instrucciones',
      _Step.listening => 'Escuchando…',
      _Step.answering => 'Responde · $_secondsLeft s',
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              _step == _Step.answering ? Icons.edit_outlined : Icons.volume_up,
              color: AppColors.teal,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                _paused ? 'En pausa' : status,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              '${_index + 1}/${widget.questions.length}',
              style: TextStyle(color: AppColors.slate),
            ),
            IconButton(
              onPressed: _togglePause,
              icon: Icon(_paused ? Icons.play_arrow : Icons.pause),
              tooltip: _paused ? 'Continuar' : 'Pausa',
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'もんだい${q.mondai.number}　${q.mondai.label}',
          style: JpText.style(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        if (_step == _Step.instruction)
          InstructionBox(text: q.mondai.instruction)
        else ...[
          Text(
            '${q.number}ばん',
            style: JpText.style(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),
          if (q.clip?.scene != null) ...[
            SceneCard(scene: q.clip!.scene!),
            const SizedBox(height: 12),
          ],
          for (var i = 0; i < q.options.length; i++)
            ExamOptionTile(
              index: i,
              text: q.mondai.hasSpokenOptions ? null : q.options[i],
              mark: i == selected ? OptionMark.selected : OptionMark.none,
              onTap: () => widget.onAnswer(q, i),
            ),
        ],
      ],
    );
  }
}

/// Picture of the situation in 発話表現. The arrow marks who speaks.
class SceneCard extends StatelessWidget {
  final String scene;

  const SceneCard({super.key, required this.scene});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sand),
      ),
      child: Text(
        scene,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 46, height: 1.3),
      ),
    );
  }
}
