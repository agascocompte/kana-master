import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/theme/app_theme.dart';

class SingleChoiceTest extends StatelessWidget {
  final TestKanaState state;
  final double kanaScale;

  const SingleChoiceTest({
    super.key,
    required this.state,
    this.kanaScale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final data = state.stateData;
    final session = data.session!;
    final QuizItem correct = data.current!;
    final bool isKanji = session.kanaType == KanaType.kanji;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final option in session.options)
            Padding(
              padding: const EdgeInsets.all(6),
              child: SizedBox(
                width: double.infinity,
                child: _OptionButton(
                  label: option.label,
                  style: _styleFor(option, data, correct),
                  fontSize: isKanji
                      ? 16
                      : (28 * kanaScale).clamp(20, 40).toDouble(),
                  onPressed: data.revealed
                      ? null
                      : () => context
                          .read<TestKanaBloc>()
                          .add(OptionSelected(option)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  _OptionStyle _styleFor(
      QuizItem option, TestKanaStateData data, QuizItem correct) {
    final bool isSelected = data.selectedOption?.label == option.label;
    if (data.revealed) {
      if (option.label == correct.label) return _OptionStyle.correct;
      if (isSelected) return _OptionStyle.wrong;
      return _OptionStyle.dimmed;
    }
    return isSelected ? _OptionStyle.selected : _OptionStyle.normal;
  }
}

enum _OptionStyle { normal, selected, correct, wrong, dimmed }

class _OptionButton extends StatelessWidget {
  const _OptionButton({
    required this.label,
    required this.style,
    required this.fontSize,
    required this.onPressed,
  });

  final String label;
  final _OptionStyle style;
  final double fontSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final (Color background, Color foreground, Color border) = switch (style) {
      _OptionStyle.normal => (AppColors.surface, AppColors.ink, AppColors.sand),
      _OptionStyle.selected => (AppColors.ink, AppColors.onInk, AppColors.ink),
      _OptionStyle.correct => (AppColors.teal, Colors.white, AppColors.teal),
      _OptionStyle.wrong => (AppColors.coral, Colors.white, AppColors.coral),
      _OptionStyle.dimmed => (AppColors.surface, AppColors.slate, AppColors.sand),
    };
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        disabledBackgroundColor: background,
        disabledForegroundColor: foreground,
        side: BorderSide(color: border, width: 1),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
      ),
    );
  }
}
