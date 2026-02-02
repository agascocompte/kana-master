abstract class KanjiMeaningsRepository {
  Future<Map<String, List<String>>> loadMeanings(String languageCode);
}
