import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/repositories/kanji_meanings_repository.dart';

@injectable
class GetKanjiMeanings {
  final KanjiMeaningsRepository repository;

  GetKanjiMeanings(this.repository);

  Future<Map<String, List<String>>> call(String languageCode) {
    return repository.loadMeanings(languageCode);
  }
}
