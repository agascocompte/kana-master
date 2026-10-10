import 'package:injectable/injectable.dart';

@injectable
class CheckMaterialAnswer {
  static const Map<String, String> _diacritics = {
    'á': 'a',
    'à': 'a',
    'â': 'a',
    'ä': 'a',
    'ã': 'a',
    'é': 'e',
    'è': 'e',
    'ê': 'e',
    'ë': 'e',
    'í': 'i',
    'ì': 'i',
    'î': 'i',
    'ï': 'i',
    'ó': 'o',
    'ò': 'o',
    'ô': 'o',
    'ö': 'o',
    'õ': 'o',
    'ú': 'u',
    'ù': 'u',
    'û': 'u',
    'ü': 'u',
    'ç': 'c',
    'ñ': 'n',
  };

  bool call(String userInput, String correct) {
    final user = _normalize(userInput);
    if (user.isEmpty) return false;
    // "a / b", "a|b", "a; b" and "a, b" list accepted alternatives.
    final alternatives = correct
        .split(RegExp(r'[/|;,]'))
        .map(_normalize)
        .where((e) => e.isNotEmpty)
        .toSet()
      ..add(_normalize(correct));
    return alternatives.contains(user);
  }

  String _normalize(String input) {
    final lower = input.toLowerCase();
    final buffer = StringBuffer();
    for (final rune in lower.runes) {
      final char = String.fromCharCode(rune);
      buffer.write(_diacritics[char] ?? char);
    }
    return buffer
        .toString()
        .replaceAll(RegExp(r'[\[\]\(\)\{\}\.,;:!?¿¡\-_/|]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}
