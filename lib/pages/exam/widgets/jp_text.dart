import 'package:flutter/material.dart';
import 'package:kana_master/theme/app_theme.dart';

/// Japanese text with the marks used in the item banks:
///
/// * `{…}` underlines the word a question asks about (＿＿＿ in the booklet).
/// * `[漢字|かんじ]` puts furigana over a word.
///
/// ASCII spaces separate phrases as in the test booklet and are shown as
/// ideographic spaces.
class JpText extends StatelessWidget {
  final String markup;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;

  const JpText(
    this.markup, {
    super.key,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
    this.color,
    this.textAlign = TextAlign.start,
  });

  static const Locale japanese = Locale('ja', 'JP');

  static TextStyle style({
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
  }) {
    // Without the locale, kanji may be drawn with Chinese glyph shapes.
    return TextStyle(
      locale: japanese,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColors.ink,
      height: 1.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    final base =
        style(fontSize: fontSize, fontWeight: fontWeight, color: color);
    return Text.rich(
      TextSpan(style: base, children: spans(markup, base)),
      textAlign: textAlign,
    );
  }

  /// Inline spans for [markup], to embed in other rich text.
  static List<InlineSpan> spans(String markup, TextStyle base) {
    final result = <InlineSpan>[];
    final underlined = base.copyWith(
      decoration: TextDecoration.underline,
      decorationThickness: 1.6,
      decorationColor: base.color,
    );
    var underline = false;
    final buffer = StringBuffer();

    void flush() {
      if (buffer.isEmpty) return;
      result.add(TextSpan(
        text: buffer.toString(),
        style: underline ? underlined : null,
      ));
      buffer.clear();
    }

    var i = 0;
    while (i < markup.length) {
      final char = markup[i];
      if (char == '{' || char == '}') {
        flush();
        underline = char == '{';
        i++;
        continue;
      }
      if (char == '[') {
        final close = markup.indexOf(']', i);
        final bar = markup.indexOf('|', i);
        if (close > 0 && bar > i && bar < close) {
          flush();
          result.add(_ruby(
            markup.substring(i + 1, bar),
            markup.substring(bar + 1, close),
            underline ? underlined : base,
          ));
          i = close + 1;
          continue;
        }
      }
      buffer.write(char == ' ' ? '　' : char);
      i++;
    }
    flush();
    return result;
  }

  static InlineSpan _ruby(String text, String reading, TextStyle style) {
    final size = style.fontSize ?? 18;
    return WidgetSpan(
      alignment: PlaceholderAlignment.bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            reading,
            style: style.copyWith(
              fontSize: size * 0.5,
              height: 1.1,
              decoration: TextDecoration.none,
            ),
          ),
          Text(text, style: style.copyWith(height: 1.25)),
        ],
      ),
    );
  }

  /// Text without marks, for plain listings.
  static String plain(String markup) {
    return markup
        .replaceAllMapped(RegExp(r'\[([^|\]]+)\|[^\]]+\]'), (m) => m[1]!)
        .replaceAll(RegExp(r'[{}]'), '')
        .replaceAll(' ', '　');
  }
}
