import 'package:injectable/injectable.dart';
import 'package:kana_master/domain/models/material_import_result.dart';
import 'package:kana_master/domain/repositories/material_repository.dart';

@injectable
class ImportMaterialCsv {
  final MaterialRepository repository;

  ImportMaterialCsv(this.repository);

  Future<MaterialImportResult?> call() {
    return repository.importCsv();
  }
}
