import 'package:flutter/material.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/test_body.dart';
import 'package:kana_master/pages/test_kana/widgets/test_buttons_row.dart';
import 'package:kana_master/pages/test_kana/widgets/test_title.dart';
import 'package:kana_master/theme/app_theme.dart';

class TestSessionView extends StatelessWidget {
  const TestSessionView({
    super.key,
    required this.state,
    required this.modeLabel,
    required this.kanaScale,
  });

  final TestKanaState state;
  final String modeLabel;
  final double kanaScale;

  @override
  Widget build(BuildContext context) {
    final keyboardInset = MediaQuery.of(context).viewInsets.bottom;
    final session = state.stateData.session!;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.fromLTRB(16, 4, 16, 16 + keyboardInset),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                context.t.app.testQuestionProgress(
                  current: session.questionNumber,
                  total: session.length,
                ),
                style: const TextStyle(
                  color: AppColors.slate,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: session.answeredCount / session.length,
                    minHeight: 6,
                    color: AppColors.teal,
                    backgroundColor: AppColors.sand,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              key: ValueKey<int>(session.questionNumber),
              padding: const EdgeInsets.all(16),
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
                children: [
                  TestTitle(state: state, kanaScale: kanaScale),
                  const SizedBox(height: 12),
                  Expanded(
                    child: TestBody(state: state, kanaScale: kanaScale),
                  ),
                  const SizedBox(height: 8),
                  TestButtonsRow(state: state),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
