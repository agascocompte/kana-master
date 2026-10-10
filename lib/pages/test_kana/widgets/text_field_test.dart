import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/domain/models/quiz_item.dart';
import 'package:kana_master/pages/test_kana/widgets/reveal_banner.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

import '../bloc/test_kana_bloc.dart';

/// Typed answer. The parent keys this widget by question, so its controller
/// starts empty for every question.
class TextFieldTest extends StatefulWidget {
  final TestKanaState state;

  const TextFieldTest({super.key, required this.state});

  @override
  State<TextFieldTest> createState() => _TextFieldTestState();
}

class _TextFieldTestState extends State<TextFieldTest> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    final data = widget.state.stateData;
    final QuizItem item = data.current!;
    final String header = switch (item.answerKind) {
      AnswerKind.romaji => tr.app.testTypeRomaji,
      AnswerKind.meaning => tr.app.testTypeMeaning,
      AnswerKind.reading => tr.app.testTypeReading,
    };

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool tiny = constraints.maxHeight < 220;
        final bool hideHeader = constraints.maxHeight < 150;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              if (data.revealed) ...[
                RevealBanner(answer: item.label),
                SizedBox(height: tiny ? 6 : 10),
              ] else if (!hideHeader) ...[
                Text(
                  header,
                  style: const TextStyle(color: AppColors.slate, fontSize: 12),
                ),
                SizedBox(height: tiny ? 8 : 14),
              ],
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: tiny ? 12 : 16,
                    vertical: tiny ? 10 : 18,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: data.revealed ? AppColors.coral : AppColors.sand,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        readOnly: data.revealed,
                        autocorrect: false,
                        enableSuggestions: false,
                        textAlign: TextAlign.center,
                        textInputAction: TextInputAction.done,
                        cursorColor: AppColors.teal,
                        style: const TextStyle(
                          fontSize: 24,
                          color: AppColors.ink,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                          hintText: tr.app.testTapToType,
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                        ),
                        onChanged: (value) => context
                            .read<TestKanaBloc>()
                            .add(UpdateUserTextAnswer(userAnswer: value)),
                        onSubmitted: (_) {
                          final bloc = context.read<TestKanaBloc>();
                          if (bloc.state.stateData.revealed) {
                            bloc.add(NextQuestion());
                          } else if (bloc.state.stateData.canSubmitAnswer) {
                            bloc.add(SubmitAnswer());
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
