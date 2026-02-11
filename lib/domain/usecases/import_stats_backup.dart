import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/repositories/stats_backup_repository.dart';

@injectable
class ImportStatsBackup {
  final StatsBackupRepository repository;

  ImportStatsBackup(this.repository);

  Future<int> call({bool replaceExisting = true}) {
    return repository.importBackupFile(replaceExisting: replaceExisting);
  }
}
