import 'package:flutter/material.dart';
import 'package:kana_master/pages/exam/widgets/jp_text.dart';
import 'package:kana_master/theme/app_theme.dart';

enum OptionMark { none, selected, correct, wrong }

/// Answer choice numbered like the booklet (１・２・３・４).
class ExamOptionTile extends StatelessWidget {
  final int index;

  /// Choice text, or null for spoken choices that only show the number.
  final String? text;
  final OptionMark mark;
  final VoidCallback? onTap;

  const ExamOptionTile({
    super.key,
    required this.index,
    this.text,
    this.mark = OptionMark.none,
    this.onTap,
  });

  static const List<String> numerals = ['１', '２', '３', '４'];

  @override
  Widget build(BuildContext context) {
    final Color border = switch (mark) {
      OptionMark.none => AppColors.sand,
      OptionMark.selected => AppColors.ink,
      OptionMark.correct => AppColors.teal,
      OptionMark.wrong => AppColors.coral,
    };
    final Color fill = switch (mark) {
      OptionMark.none => AppColors.surface,
      OptionMark.selected => AppColors.sand,
      OptionMark.correct => AppColors.teal.withAlpha(40),
      OptionMark.wrong => AppColors.coral.withAlpha(40),
    };
    final bool filled = mark != OptionMark.none;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: fill,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: border, width: filled ? 2 : 1),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filled ? border : Colors.transparent,
                    border: Border.all(color: border, width: 1.5),
                  ),
                  child: Text(
                    numerals[index],
                    style: JpText.style(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: filled ? AppColors.surface : AppColors.ink,
                    ).copyWith(height: 1.1),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: text == null
                      ? const SizedBox(height: 32)
                      : JpText(text!, fontSize: 18),
                ),
                if (mark == OptionMark.correct)
                  Icon(Icons.check_circle, color: AppColors.teal),
                if (mark == OptionMark.wrong)
                  Icon(Icons.cancel, color: AppColors.coral),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
