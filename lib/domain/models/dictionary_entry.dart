class DictionaryEntry {
  final String word;
  final String reading;
  final List<String> meanings;

  DictionaryEntry({
    required this.word,
    required this.reading,
    required this.meanings,
  });

  factory DictionaryEntry.fromJson(Map<String, dynamic> json) {
    List<dynamic> japanese = json['japanese'] ?? [];
    Map<String, dynamic>? primary = japanese.isNotEmpty
        ? japanese.first as Map<String, dynamic>
        : null;
    String reading = primary?['reading'] ?? '';
    String word = primary?['word'] ?? reading;

    List<dynamic> senses = json['senses'] ?? [];
    List<String> meanings = senses
        .expand((sense) =>
            (sense['english_definitions'] as List<dynamic>? ?? []))
        .map((definition) => definition.toString())
        .toList();

    return DictionaryEntry(
      word: word,
      reading: reading,
      meanings: meanings,
    );
  }
}
