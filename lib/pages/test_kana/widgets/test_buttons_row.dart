import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/test_button.dart';
import 'package:kana_master/theme/app_theme.dart';

class TestButtonsRow extends StatelessWidget {
  const TestButtonsRow({
    super.key,
    required this.kanaType,
    required this.difficultyLevel,
    required this.kana,
    required this.state,
  });

  final TestKanaState state;
  final KanaType kanaType;
  final DifficultyLevel difficultyLevel;
  final Map<String, String> kana;

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    final bool drawing = state.stateData.testType == TestType.drawingTest;
    final bool showTemplateToggle =
        drawing && !state.stateData.currentScriptUsesModel;
    final bool showReport = drawing && state.stateData.canReportDrawing;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 62,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: (showTemplateToggle || showReport)
                ? Container(
                    key: ValueKey('${showTemplateToggle}_$showReport'),
                    margin: const EdgeInsets.only(bottom: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.mist,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.sand),
                    ),
                    child: Row(
                      children: [
                        if (showTemplateToggle)
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => context
                                  .read<TestKanaBloc>()
                                  .add(ToggleKanjiTemplate()),
                              icon: Icon(
                                state.stateData.showKanjiTemplate
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 18,
                              ),
                              label: Text(
                                state.stateData.showKanjiTemplate
                                    ? tr.app.testGuideHide
                                    : tr.app.testGuideShow,
                              ),
                            ),
                          ),
                        if (showTemplateToggle && showReport)
                          const SizedBox(width: 8),
                        if (showReport)
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: state.stateData.reportBusy
                                  ? null
                                  : () => context
                                      .read<TestKanaBloc>()
                                      .add(ReportDrawingFalseNegative()),
                              icon: state.stateData.reportBusy
                                  ? const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Icon(Icons.flag_outlined, size: 18),
                              label: Text(tr.app.testReportDrawing),
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.ink,
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TestButton(
              icon: const Icon(Icons.cancel_outlined),
              backgroundColor: AppColors.sand,
              iconColor: AppColors.ink,
              heroTag: "cancel",
              onPressed: () => context.read<TestKanaBloc>().add(ResetTest()),
            ),
            if (drawing)
              TestButton(
                icon: const Icon(Icons.replay_outlined),
                backgroundColor: AppColors.sand,
                iconColor: AppColors.ink,
                heroTag: "clear",
                onPressed: () => context.read<TestKanaBloc>().add(ClearDrawing()),
              ),
            TestButton(
              icon: const Icon(Icons.check_outlined),
              heroTag: "submit",
              backgroundColor: state.stateData.canSubmitAnswer
                  ? AppColors.ink
                  : AppColors.sand,
              iconColor: state.stateData.canSubmitAnswer
                  ? Colors.white
                  : AppColors.graphite,
              opacity: state.stateData.canSubmitAnswer ? 1.0 : 0.5,
              onPressed: state.stateData.canSubmitAnswer
                  ? () => drawing
                      ? context.read<TestKanaBloc>().add(CaptureImage())
                      : context.read<TestKanaBloc>().add(CheckAnswer(
                            kanaType: kanaType,
                            difficultyLevel: difficultyLevel,
                            kana: kana,
                          ))
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
