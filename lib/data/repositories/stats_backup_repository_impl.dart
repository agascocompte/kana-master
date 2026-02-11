import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:kana_master/data/datasources/stats_backup_file_data_source.dart';
import 'package:kana_master/data/datasources/stats_backup_local_data_source.dart';
import 'package:kana_master/domain/models/stats_backup.dart';
import 'package:kana_master/domain/repositories/stats_backup_repository.dart';

@LazySingleton(as: StatsBackupRepository)
class StatsBackupRepositoryImpl implements StatsBackupRepository {
  final StatsBackupLocalDataSource localDataSource;
  final StatsBackupFileDataSource fileDataSource;

  StatsBackupRepositoryImpl(
    this.localDataSource,
    this.fileDataSource,
  );

  @override
  Future<String> exportBackupFile() async {
    final responses = await localDataSource.readAllResponses();
    final backup = StatsBackup(
      version: 1,
      exportedAt: DateTime.now().toUtc().toIso8601String(),
      responses: responses,
    );
    final content = jsonEncode(backup.toJson());
    return fileDataSource.saveBackupContents(content);
  }

  @override
  Future<int> importBackupFile({bool replaceExisting = true}) async {
    final contents = await fileDataSource.pickBackupFileContents();
    if (contents == null || contents.trim().isEmpty) {
      throw Exception('No backup file selected.');
    }
    final decoded = jsonDecode(contents);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Invalid backup format.');
    }
    final backup = StatsBackup.fromJson(decoded);
    if (backup.responses.isEmpty) {
      throw Exception('Backup file has no responses.');
    }
    if (replaceExisting) {
      await localDataSource.replaceResponses(backup.responses);
    } else {
      await localDataSource.replaceResponses(backup.responses);
    }
    return backup.responses.length;
  }
}
