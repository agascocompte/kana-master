class DictionaryEntry {
  final String word;
  final String reading;
  final List<String> meanings;
  final List<String> tags;
  final List<String> jlpt;
  final List<String> partsOfSpeech;
  final List<String> info;
  final List<String> seeAlso;

  DictionaryEntry({
    required this.word,
    required this.reading,
    required this.meanings,
    this.tags = const [],
    this.jlpt = const [],
    this.partsOfSpeech = const [],
    this.info = const [],
    this.seeAlso = const [],
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

    List<String> partsOfSpeech = senses
        .expand((sense) => (sense['parts_of_speech'] as List<dynamic>? ?? []))
        .map((p) => p.toString())
        .toSet()
        .toList();

    List<String> info = senses
        .expand((sense) => (sense['info'] as List<dynamic>? ?? []))
        .map((i) => i.toString())
        .toSet()
        .toList();

    List<String> seeAlso = senses
        .expand((sense) => (sense['see_also'] as List<dynamic>? ?? []))
        .map((i) => i.toString())
        .toSet()
        .toList();

    return DictionaryEntry(
      word: word,
      reading: reading,
      meanings: meanings,
      tags: (json['tags'] as List<dynamic>? ?? [])
          .map((t) => t.toString())
          .toList(),
      jlpt: (json['jlpt'] as List<dynamic>? ?? [])
          .map((t) => t.toString())
          .toList(),
      partsOfSpeech: partsOfSpeech,
      info: info,
      seeAlso: seeAlso,
    );
  }
}
