import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TestButton(
          icon: const Icon(Icons.cancel_outlined),
          backgroundColor: AppColors.sand,
          iconColor: AppColors.ink,
          heroTag: "cancel",
          onPressed: () => context.read<TestKanaBloc>().add(ResetTest()),
        ),
        if (state.stateData.testType == TestType.drawingTest)
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
          backgroundColor:
              state.stateData.canSubmitAnswer ? AppColors.ink : AppColors.sand,
          iconColor: state.stateData.canSubmitAnswer
              ? Colors.white
              : AppColors.graphite,
          opacity: state.stateData.canSubmitAnswer ? 1.0 : 0.5,
          onPressed: state.stateData.canSubmitAnswer
              ? () => state.stateData.testType == TestType.drawingTest
                  ? context.read<TestKanaBloc>().add(CaptureImage())
                  : context.read<TestKanaBloc>().add(CheckAnswer(
                        kanaType: kanaType,
                        difficultyLevel: difficultyLevel,
                        kana: kana,
                      ))
              : null,
        ),
      ],
    );
  }
}
