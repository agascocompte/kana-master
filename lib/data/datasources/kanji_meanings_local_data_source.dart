import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class KanjiMeaningsLocalDataSource {
  Future<Map<String, List<String>>> loadFromAsset(String path) async {
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
