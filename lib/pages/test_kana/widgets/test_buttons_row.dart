import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/pages/test_kana/widgets/test_button.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/widgets/dialogs.dart';

class TestButtonsRow extends StatelessWidget {
  const TestButtonsRow({super.key, required this.state});

  final TestKanaState state;

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    final data = state.stateData;
    final bool drawing = data.testType == TestType.drawingTest;
    final bool revealed = data.revealed;
    final bool showTemplateToggle =
        drawing && !revealed && !data.currentScriptUsesModel;
    final bool showReport = drawing && revealed && data.canReportDrawing;
    final bool canSubmit = data.canSubmitAnswer && !revealed;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (drawing)
          SizedBox(
            height: 58,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              child: (showTemplateToggle || showReport)
                  ? Padding(
                      key: ValueKey('${showTemplateToggle}_$showReport'),
                      padding: const EdgeInsets.fromLTRB(10, 4, 10, 10),
                      child: Row(
                        children: [
                          if (showTemplateToggle)
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => context
                                    .read<TestKanaBloc>()
                                    .add(ToggleKanjiTemplate()),
                                icon: Icon(
                                  data.showKanjiTemplate
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 18,
                                ),
                                label: Text(
                                  data.showKanjiTemplate
                                      ? tr.app.testGuideHide
                                      : tr.app.testGuideShow,
                                ),
                              ),
                            ),
                          if (showReport)
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: data.reportBusy
                                    ? null
                                    : () async {
                                        final bool shouldSend = await Dialogs
                                            .showReportDrawingConfirmDialog(
                                                context);
                                        if (!shouldSend || !context.mounted) {
                                          return;
                                        }
                                        context
                                            .read<TestKanaBloc>()
                                            .add(ReportDrawingFalseNegative());
                                      },
                                icon: data.reportBusy
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
                                  foregroundColor: Colors.white,
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
              icon: const Icon(Icons.close_rounded),
              backgroundColor: AppColors.sand,
              iconColor: AppColors.ink,
              heroTag: "cancel",
              tooltip: tr.app.sessionExit,
              onPressed: () => context.read<TestKanaBloc>().add(ResetTest()),
            ),
            if (drawing && !revealed)
              TestButton(
                icon: const Icon(Icons.replay_outlined),
                backgroundColor: AppColors.sand,
                iconColor: AppColors.ink,
                heroTag: "clear",
                onPressed: () =>
                    context.read<TestKanaBloc>().add(ClearDrawing()),
              ),
            if (revealed)
              TestButton(
                icon: const Icon(Icons.arrow_forward_rounded),
                heroTag: "next",
                tooltip: tr.app.testNext,
                backgroundColor: AppColors.ink,
                iconColor: Colors.white,
                onPressed: () =>
                    context.read<TestKanaBloc>().add(NextQuestion()),
              )
            else
              TestButton(
                icon: const Icon(Icons.check_outlined),
                heroTag: "submit",
                backgroundColor: canSubmit ? AppColors.ink : AppColors.sand,
                iconColor: canSubmit ? Colors.white : AppColors.graphite,
                opacity: canSubmit ? 1.0 : 0.5,
                onPressed: canSubmit
                    ? () => context.read<TestKanaBloc>().add(
                        drawing ? CaptureImage() : SubmitAnswer())
                    : null,
              ),
          ],
        ),
      ],
    );
  }
}
