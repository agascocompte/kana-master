class KanjiEntry {
  final String character;
  final String unicode;
  final List<String> readingsOn;
  final List<String> readingsKun;
  final List<String> readingsName;
  final int strokeCount;
  final String jlpt;
  final List<String> tags;

  const KanjiEntry({
    required this.character,
    required this.unicode,
    required this.readingsOn,
    required this.readingsKun,
    required this.readingsName,
    required this.strokeCount,
    required this.jlpt,
    this.tags = const [],
  });

  List<String> get readings =>
      [...readingsOn, ...readingsKun, ...readingsName];

  factory KanjiEntry.fromCharacter({
    required String character,
    required List<String> readingsOn,
    required List<String> readingsKun,
    required List<String> readingsName,
    required int strokeCount,
    required String jlpt,
    List<String> tags = const [],
  }) {
    return KanjiEntry(
      character: character,
      unicode: _unicodeFor(character),
      readingsOn: readingsOn,
      readingsKun: readingsKun,
      readingsName: readingsName,
      strokeCount: strokeCount,
      jlpt: jlpt,
      tags: tags,
    );
  }

  factory KanjiEntry.fromCsvRow({
    required String character,
    required String readingsOn,
    required String readingsKun,
    required String readingsName,
    required String strokeNumber,
    required String unicode,
    required String jlpt,
  }) {
    return KanjiEntry(
      character: character,
      unicode: _padUnicode(unicode),
      readingsOn: _splitList(readingsOn),
      readingsKun: _splitList(readingsKun),
      readingsName: _splitList(readingsName),
      strokeCount: int.tryParse(strokeNumber.trim()) ?? 0,
      jlpt: jlpt.trim(),
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
