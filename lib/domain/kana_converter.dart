/// Conversions used to compare kana answers regardless of how they were
/// typed: hiragana, katakana or romaji (Hepburn or Kunrei-shiki).
class KanaConverter {
  KanaConverter._();

  static const int _katakanaStart = 0x30A1; // ァ
  static const int _katakanaEnd = 0x30F6; // ヶ
  static const int _kanaOffset = 0x60;

  /// Converts katakana to hiragana, leaving any other character untouched.
  static String toHiragana(String input) {
    final buffer = StringBuffer();
    for (final rune in input.runes) {
      if (rune >= _katakanaStart && rune <= _katakanaEnd) {
        buffer.writeCharCode(rune - _kanaOffset);
      } else {
        buffer.writeCharCode(rune);
      }
    }
    return buffer.toString();
  }

  static bool isKana(String input) =>
      input.isNotEmpty &&
      input.runes.every((r) =>
          (r >= 0x3041 && r <= 0x3096) || // hiragana
          (r >= _katakanaStart && r <= 0x30FA) || // katakana
          r == 0x30FC); // ー

  static const Map<String, String> _romajiTable = {
    // Three letters.
    'kya': 'きゃ', 'kyu': 'きゅ', 'kyo': 'きょ',
    'sha': 'しゃ', 'shu': 'しゅ', 'sho': 'しょ', 'she': 'しぇ',
    'sya': 'しゃ', 'syu': 'しゅ', 'syo': 'しょ',
    'shi': 'し',
    'cha': 'ちゃ', 'chu': 'ちゅ', 'cho': 'ちょ', 'che': 'ちぇ',
    'tya': 'ちゃ', 'tyu': 'ちゅ', 'tyo': 'ちょ',
    'cya': 'ちゃ', 'cyu': 'ちゅ', 'cyo': 'ちょ',
    'chi': 'ち', 'tsu': 'つ',
    'nya': 'にゃ', 'nyu': 'にゅ', 'nyo': 'にょ',
    'hya': 'ひゃ', 'hyu': 'ひゅ', 'hyo': 'ひょ',
    'mya': 'みゃ', 'myu': 'みゅ', 'myo': 'みょ',
    'rya': 'りゃ', 'ryu': 'りゅ', 'ryo': 'りょ',
    'gya': 'ぎゃ', 'gyu': 'ぎゅ', 'gyo': 'ぎょ',
    'jya': 'じゃ', 'jyu': 'じゅ', 'jyo': 'じょ',
    'zya': 'じゃ', 'zyu': 'じゅ', 'zyo': 'じょ',
    'dya': 'ぢゃ', 'dyu': 'ぢゅ', 'dyo': 'ぢょ',
    'bya': 'びゃ', 'byu': 'びゅ', 'byo': 'びょ',
    'pya': 'ぴゃ', 'pyu': 'ぴゅ', 'pyo': 'ぴょ',
    // Two letters.
    'ka': 'か', 'ki': 'き', 'ku': 'く', 'ke': 'け', 'ko': 'こ',
    'sa': 'さ', 'si': 'し', 'su': 'す', 'se': 'せ', 'so': 'そ',
    'ta': 'た', 'ti': 'ち', 'tu': 'つ', 'te': 'て', 'to': 'と',
    'na': 'な', 'ni': 'に', 'nu': 'ぬ', 'ne': 'ね', 'no': 'の',
    'ha': 'は', 'hi': 'ひ', 'fu': 'ふ', 'hu': 'ふ', 'he': 'へ', 'ho': 'ほ',
    'ma': 'ま', 'mi': 'み', 'mu': 'む', 'me': 'め', 'mo': 'も',
    'ya': 'や', 'yu': 'ゆ', 'yo': 'よ',
    'ra': 'ら', 'ri': 'り', 'ru': 'る', 're': 'れ', 'ro': 'ろ',
    'la': 'ら', 'li': 'り', 'lu': 'る', 'le': 'れ', 'lo': 'ろ',
    'wa': 'わ', 'wo': 'を',
    'ga': 'が', 'gi': 'ぎ', 'gu': 'ぐ', 'ge': 'げ', 'go': 'ご',
    'za': 'ざ', 'ji': 'じ', 'zi': 'じ', 'zu': 'ず', 'ze': 'ぜ', 'zo': 'ぞ',
    'ja': 'じゃ', 'ju': 'じゅ', 'jo': 'じょ', 'je': 'じぇ',
    'da': 'だ', 'di': 'ぢ', 'du': 'づ', 'de': 'で', 'do': 'ど',
    'ba': 'ば', 'bi': 'び', 'bu': 'ぶ', 'be': 'べ', 'bo': 'ぼ',
    'pa': 'ぱ', 'pi': 'ぴ', 'pu': 'ぷ', 'pe': 'ぺ', 'po': 'ぽ',
    'fa': 'ふぁ', 'fi': 'ふぃ', 'fe': 'ふぇ', 'fo': 'ふぉ',
    'va': 'ゔぁ', 'vi': 'ゔぃ', 'vu': 'ゔ', 've': 'ゔぇ', 'vo': 'ゔぉ',
    // One letter.
    'a': 'あ', 'i': 'い', 'u': 'う', 'e': 'え', 'o': 'お',
    '-': 'ー',
  };

  static const String _vowels = 'aeiou';

  /// Converts romaji to hiragana. Returns null when the text can't be fully
  /// converted (e.g. it contains letters that don't form valid kana).
  static String? romajiToHiragana(String input) {
    final text = input.toLowerCase().replaceAll(RegExp(r'\s'), '');
    final buffer = StringBuffer();
    int i = 0;
    while (i < text.length) {
      final char = text[i];
      final next = i + 1 < text.length ? text[i + 1] : '';

      // "n'" separates ん from a following vowel ("kan'i" → かんい).
      if (char == 'n' && next == "'") {
        buffer.write('ん');
        i += 2;
        continue;
      }
      if (char == "'") {
        i++;
        continue;
      }
      // "nn": ん, and the second n still starts the next syllable when a
      // vowel or "y" follows ("konnichi" → こんにち, "hon'ya"/"honnya").
      if (char == 'n' && next == 'n') {
        final after = i + 2 < text.length ? text[i + 2] : '';
        buffer.write('ん');
        i += (_vowels.contains(after) || after == 'y') && after.isNotEmpty
            ? 1
            : 2;
        continue;
      }

      // Doubled consonant → small tsu (kitte, matcha via "tch").
      if (char == next && !_vowels.contains(char) && char != 'n') {
        buffer.write('っ');
        i++;
        continue;
      }
      if (char == 't' && next == 'c') {
        buffer.write('っ');
        i++;
        continue;
      }
      // "n" not followed by a vowel or "y" is ん ("kanji", "hon").
      if (char == 'n' &&
          (next.isEmpty ||
              (next != 'n' && !_vowels.contains(next) && next != 'y'))) {
        buffer.write('ん');
        i++;
        continue;
      }

      String? kana;
      for (int length = 3; length >= 1 && kana == null; length--) {
        if (i + length > text.length) continue;
        final chunk = text.substring(i, i + length);
        final match = _romajiTable[chunk];
        if (match != null) {
          kana = match;
          i += length;
        }
      }
      if (kana == null) return null;
      buffer.write(kana);
    }
    return buffer.toString();
  }

  /// Normalises a typed answer to hiragana: kana is kept (katakana folded to
  /// hiragana) and romaji is converted. Returns null if it isn't kana-like.
  static String? normalizeToHiragana(String input) {
    final trimmed = input.trim().replaceAll(RegExp(r'[\s・.\-]'), '');
    if (trimmed.isEmpty) return null;
    if (isKana(trimmed)) return toHiragana(trimmed);
    final converted = romajiToHiragana(trimmed);
    return converted == null ? null : toHiragana(converted);
  }
}
