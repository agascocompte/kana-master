import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kana_master/constants.dart';
import 'package:kana_master/theme/app_theme.dart';
import 'package:kana_master/i18n/strings.g.dart';

import '../bloc/test_kana_bloc.dart';

class TextFieldTest extends StatelessWidget {
  final KanaType kanaType;

  const TextFieldTest({
    super.key,
    required this.kanaType,
  });

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool tiny = constraints.maxHeight < 220;
        final bool hideHeader = constraints.maxHeight < 150;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              if (!hideHeader) ...[
                Text(
                  kanaType == KanaType.kanji
                      ? tr.app.testTypeMeaning
                      : tr.app.testTypeRomaji,
                  style: const TextStyle(
                    color: AppColors.slate,
                    fontSize: 12,
                  ),
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
                    border: Border.all(color: AppColors.sand, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: LayoutBuilder(
                    builder: (context, inner) {
                      return SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: inner.maxHeight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                textAlign: TextAlign.center,
                                cursorColor: AppColors.teal,
                                style: TextStyle(
                                  fontSize: tiny ? 24 : 30,
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
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
