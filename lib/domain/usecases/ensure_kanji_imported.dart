import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/repositories/kanji_repository.dart';

@injectable
class EnsureKanjiImported {
  final KanjiRepository repository;

  EnsureKanjiImported(this.repository);

  Future<void> call() {
    return repository.ensureKanjiImported();
  }
}
