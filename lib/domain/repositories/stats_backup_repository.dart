abstract class StatsBackupRepository {
  Future<String> exportBackupFile();
  Future<int> importBackupFile({
    bool replaceExisting = true,
  });
}
