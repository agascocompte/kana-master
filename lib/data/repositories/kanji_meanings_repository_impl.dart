import 'package:injectable/injectable.dart';
import 'package:kana_master/data/datasources/kanji_meanings_local_data_source.dart';
import 'package:kana_master/domain/repositories/kanji_meanings_repository.dart';

@LazySingleton(as: KanjiMeaningsRepository)
class KanjiMeaningsRepositoryImpl implements KanjiMeaningsRepository {
  final KanjiMeaningsLocalDataSource localDataSource;

  KanjiMeaningsRepositoryImpl(this.localDataSource);

  @override
  Future<Map<String, List<String>>> loadMeanings(String languageCode) async {
    final Map<String, List<String>> meanings = await localDataSource
        .loadFromAsset('assets/i18n/kanji_$languageCode.json');
    if (meanings.isNotEmpty) {
      return meanings;
    }
    return localDataSource.loadFromAsset('assets/i18n/kanji_es.json');
  }
}
