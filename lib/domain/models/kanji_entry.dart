class KanjiEntry {
  final String character;
  final String unicode;
  final List<String> readingsOn;
  final List<String> readingsKun;
  final int strokeCount;
  final List<String> tags;

  const KanjiEntry({
    required this.character,
    required this.unicode,
    required this.readingsOn,
    required this.readingsKun,
    required this.strokeCount,
    this.tags = const [],
  });

  List<String> get readings => [...readingsOn, ...readingsKun];

  factory KanjiEntry.fromCharacter({
    required String character,
    required List<String> readingsOn,
    required List<String> readingsKun,
    required int strokeCount,
    List<String> tags = const [],
  }) {
    return KanjiEntry(
      character: character,
      unicode: _unicodeFor(character),
      readingsOn: readingsOn,
      readingsKun: readingsKun,
      strokeCount: strokeCount,
      tags: tags,
    );
  }

  factory KanjiEntry.fromCsvRow({
    required String character,
    required String readingsOn,
    required String readingsKun,
    required String strokeNumber,
    required String unicode,
  }) {
    return KanjiEntry(
      character: character,
      unicode: _padUnicode(unicode),
      readingsOn: _splitList(readingsOn),
      readingsKun: _splitList(readingsKun),
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
