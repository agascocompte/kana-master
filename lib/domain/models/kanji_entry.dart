class KanjiEntry {
  final String character;
  final String unicode;
  final List<String> readings;
  final List<String> meanings;
  final int strokeCount;
  final List<String> tags;

  const KanjiEntry({
    required this.character,
    required this.unicode,
    required this.readings,
    required this.meanings,
    required this.strokeCount,
    this.tags = const [],
  });

  factory KanjiEntry.fromCharacter({
    required String character,
    required List<String> readings,
    required List<String> meanings,
    required int strokeCount,
    List<String> tags = const [],
  }) {
    return KanjiEntry(
      character: character,
      unicode: _unicodeFor(character),
      readings: readings,
      meanings: meanings,
      strokeCount: strokeCount,
      tags: tags,
    );
  }

  factory KanjiEntry.fromCsvRow({
    required String character,
    required String meanings,
    required String readings,
    required String strokeNumber,
    required String unicode,
  }) {
    return KanjiEntry(
      character: character,
      unicode: _padUnicode(unicode),
      readings: _splitList(readings),
      meanings: _splitList(meanings),
      strokeCount: int.tryParse(strokeNumber.trim()) ?? 0,
    );
  }
}

String _unicodeFor(String character) {
  final int codePoint = character.runes.first;
  final String hex = codePoint.toRadixString(16).toUpperCase().padLeft(4, '0');
  return 'U+$hex';
}

List<String> _splitList(String value) {
  return value
      .split(';')
      .map((entry) => entry.trim())
      .where((entry) => entry.isNotEmpty)
      .toList(growable: false);
}

String _padUnicode(String unicode) {
  return unicode.trim().toLowerCase().padLeft(5, '0');
}
