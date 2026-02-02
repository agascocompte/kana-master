import 'package:kana_master/domain/models/material_import_result.dart';

abstract class MaterialRepository {
  Future<MaterialImportResult?> importCsv();
}
