class KanaEntry {
  final String character;
  final String unicode;
  final String reading;
  final String assetKey;
  final bool isCommon;

  const KanaEntry({
    required this.character,
    required this.unicode,
    required this.reading,
    required this.assetKey,
    this.isCommon = true,
  });

  factory KanaEntry.fromCharacter({
    required String character,
    required String reading,
    String? assetKey,
    bool isCommon = true,
  }) {
    final String unicode = _unicodeFor(character);
    return KanaEntry(
      character: character,
      unicode: unicode,
      reading: reading,
      assetKey: assetKey ?? _assetKeyFor(character),
      isCommon: isCommon,
    );
  }
}

String _unicodeFor(String character) {
  final int codePoint = character.runes.first;
  final String hex = codePoint.toRadixString(16).toUpperCase().padLeft(4, '0');
  return 'U+$hex';
}

String _assetKeyFor(String character) {
  final int codePoint = character.runes.first;
  return codePoint.toRadixString(16).toLowerCase().padLeft(5, '0');
}
