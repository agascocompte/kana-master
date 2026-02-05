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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double targetHeight =
            (constraints.maxHeight * 0.55).clamp(180.0, 320.0);
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                kanaType == KanaType.kanji
                    ? t.app.testTypeMeaning
                    : t.app.testTypeRomaji,
                style: const TextStyle(
                  color: AppColors.slate,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                height: targetHeight,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      kanaType == KanaType.kanji
                          ? t.app.testMeaningLabel
                          : t.app.testRomajiLabel,
                      style: const TextStyle(
                        color: AppColors.graphite,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      textAlign: TextAlign.center,
                      cursorColor: AppColors.teal,
                      style: const TextStyle(
                        fontSize: 30,
                        color: AppColors.ink,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                        hintText: t.app.testTapToType,
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
            ],
          ),
        );
      },
    );
  }
}
