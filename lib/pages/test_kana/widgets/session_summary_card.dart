import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

/// Score and mistakes of a finished session.
class SessionSummaryCard extends StatelessWidget {
  const SessionSummaryCard({super.key, required this.session});

  final TestSession session;

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    final int total = session.answeredCount;
    final double ratio = total == 0 ? 0 : session.correctCount / total;
    // Unique mistakes, keeping the order they happened in.
    final List<QuizItem> mistakes = session.mistakes.toSet().toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.sand),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              session.isReview
                  ? tr.app.sessionReviewSummaryTitle
                  : tr.app.sessionSummaryTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: ratio,
                      strokeWidth: 10,
                      color: ratio >= 0.8
                          ? AppColors.teal
                          : ratio >= 0.5
                              ? AppColors.peach
                              : AppColors.coral,
                      backgroundColor: AppColors.sand,
                    ),
                    Center(
                      child: Text(
                        '${(ratio * 100).round()}%',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              tr.app.sessionScore(correct: session.correctCount, total: total),
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.slate, fontSize: 14),
            ),
            const SizedBox(height: 18),
            if (mistakes.isEmpty)
              Text(
                tr.app.sessionPerfect,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.teal,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              )
            else ...[
              Text(
                tr.app.sessionMistakesTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final item in mistakes) _MistakeChip(item: item),
                ],
              ),
            ],
            const SizedBox(height: 22),
            if (mistakes.isNotEmpty) ...[
              ElevatedButton.icon(
                onPressed: () =>
                    context.read<TestKanaBloc>().add(ReviewMistakes()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.coral,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                icon: const Icon(Icons.refresh_rounded),
                label: Text(
                    tr.app.sessionReviewMistakes(count: mistakes.length)),
              ),
              const SizedBox(height: 10),
            ],
            ElevatedButton.icon(
              onPressed: () =>
                  context.read<TestKanaBloc>().add(RestartSession()),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.ink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              icon: const Icon(Icons.play_arrow),
              label: Text(tr.app.sessionNew),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () => context.read<TestKanaBloc>().add(ResetTest()),
              child: Text(tr.app.sessionExit),
            ),
          ],
        ),
      ),
    );
  }
}

class _MistakeChip extends StatelessWidget {
  const _MistakeChip({required this.item});

  final QuizItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.mist,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.sand),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: item.symbol,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            TextSpan(
              text: '  ${item.label}',
              style: const TextStyle(fontSize: 13, color: AppColors.slate),
            ),
          ],
        ),
      ),
    );
  }
}
