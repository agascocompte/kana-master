class MaterialEntry {
  final Map<String, String> values;

  MaterialEntry({required this.values});

  factory MaterialEntry.fromRow(List<String> headers, List<dynamic> row) {
    final map = <String, String>{};
    for (int i = 0; i < headers.length; i++) {
      final value = i < row.length ? row[i] : '';
      map[headers[i]] = value.toString().trim();
    }
    return MaterialEntry(values: map);
  }

  bool get hasAnyValue {
    return values.values.any((v) => v.trim().isNotEmpty);
  }
}
