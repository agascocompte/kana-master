import 'package:injectable/injectable.dart';
import 'package:kana_master/data/datasources/kanji_local_data_source.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/domain/repositories/kanji_repository.dart';

@LazySingleton(as: KanjiRepository)
class KanjiRepositoryImpl implements KanjiRepository {
  final KanjiLocalDataSource localDataSource;

  KanjiRepositoryImpl(this.localDataSource);

  @override
  Future<void> ensureKanjiImported() async {
    final int count = await localDataSource.getKanjiCount();
    final int jlptCount = await localDataSource.getKanjiWithJlptCount();
    if (count > 0 && jlptCount > 0) return;
    if (count > 0 && jlptCount == 0) {
      await localDataSource.clearKanji();
    }
    await localDataSource.importFromCsvAsset('assets/csv/kanji_data.csv');
  }

  @override
  Future<List<KanjiEntry>> getAllKanji() {
    return localDataSource.getAllKanji();
  }
}
