import 'package:kana_master/domain/models/kanji_entry.dart';

abstract class KanjiRepository {
  Future<void> ensureKanjiImported();
  Future<List<KanjiEntry>> getAllKanji();
}
