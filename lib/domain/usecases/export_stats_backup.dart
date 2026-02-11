import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/repositories/stats_backup_repository.dart';

@injectable
class ExportStatsBackup {
  final StatsBackupRepository repository;

  ExportStatsBackup(this.repository);

  Future<String> call() {
    return repository.exportBackupFile();
  }
}
