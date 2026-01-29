import 'dart:convert';

import 'package:flutter/services.dart';

class KanjiMeaningsRepository {
  Future<Map<String, List<String>>> loadMeanings(String languageCode) async {
    final Map<String, List<String>> meanings =
        await _loadFromAsset('assets/i18n/kanji_${languageCode}.json');
    if (meanings.isNotEmpty) {
      return meanings;
    }
    return _loadFromAsset('assets/i18n/kanji_es.json');
  }

  Future<Map<String, List<String>>> _loadFromAsset(String path) async {
    try {
      final String jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> data =
          json.decode(jsonString) as Map<String, dynamic>;
      return data.map((key, value) {
        final List<dynamic> list = value as List<dynamic>? ?? [];
        return MapEntry(
          key.trim().toLowerCase(),
          list.map((item) => item.toString()).toList(growable: false),
        );
      });
    } catch (_) {
      return {};
    }
  }
}
