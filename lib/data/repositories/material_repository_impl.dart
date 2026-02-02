import 'package:injectable/injectable.dart';
import 'package:kana_master/data/datasources/material_csv_data_source.dart';
import 'package:kana_master/domain/models/material_import_result.dart';
import 'package:kana_master/domain/repositories/material_repository.dart';

@LazySingleton(as: MaterialRepository)
class MaterialRepositoryImpl implements MaterialRepository {
  final MaterialCsvDataSource dataSource;

  MaterialRepositoryImpl(this.dataSource);

  @override
  Future<MaterialImportResult?> importCsv() {
    return dataSource.pickAndParseCsv();
  }
}
