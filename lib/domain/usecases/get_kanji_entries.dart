import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/models/kanji_entry.dart';
import 'package:kana_master/domain/repositories/kanji_repository.dart';

@injectable
class GetKanjiEntries {
  final KanjiRepository repository;

  GetKanjiEntries(this.repository);

  Future<List<KanjiEntry>> call() {
    return repository.getAllKanji();
  }
}
