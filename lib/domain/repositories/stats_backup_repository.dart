abstract class StatsBackupRepository {
  Future<String> exportBackupFile();
  Future<int> importBackupFile();
}
