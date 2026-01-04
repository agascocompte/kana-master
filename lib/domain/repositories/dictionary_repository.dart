import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kana_master/domain/models/dictionary_entry.dart';

class DictionaryRepository {
  final String _baseUrl = 'https://jisho.org/api/v1/search/words';

  Future<List<DictionaryEntry>> search(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    final uri = Uri.parse(_baseUrl).replace(queryParameters: {
      'keyword': query,
    });
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Error al buscar en Jisho: ${response.statusCode}');
    }

    final Map<String, dynamic> jsonBody =
        json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> data = jsonBody['data'] ?? [];

    return data
        .map((item) => DictionaryEntry.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
