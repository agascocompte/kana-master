// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:kana_master/data/datasources/kanji_local_data_source.dart'
    as _i439;
import 'package:kana_master/data/datasources/kanji_meanings_local_data_source.dart'
    as _i188;
import 'package:kana_master/data/datasources/material_csv_data_source.dart'
    as _i258;
import 'package:kana_master/data/repositories/kanji_meanings_repository_impl.dart'
    as _i1027;
import 'package:kana_master/data/repositories/kanji_repository_impl.dart'
    as _i590;
import 'package:kana_master/data/repositories/material_repository_impl.dart'
    as _i225;
import 'package:kana_master/domain/providers/database_provider.dart' as _i918;
import 'package:kana_master/domain/repositories/dictionary_repository.dart'
    as _i592;
import 'package:kana_master/domain/repositories/kanji_meanings_repository.dart'
    as _i445;
import 'package:kana_master/domain/repositories/kanji_repository.dart' as _i785;
import 'package:kana_master/domain/repositories/material_repository.dart'
    as _i863;
import 'package:kana_master/domain/repositories/score_repository.dart' as _i867;
import 'package:kana_master/domain/repositories/settings_repository.dart'
    as _i816;
import 'package:kana_master/domain/usecases/check_material_answer.dart'
    as _i763;
import 'package:kana_master/domain/usecases/ensure_kanji_imported.dart' as _i75;
import 'package:kana_master/domain/usecases/get_kanji_entries.dart' as _i283;
import 'package:kana_master/domain/usecases/get_kanji_meanings.dart' as _i340;
import 'package:kana_master/domain/usecases/import_material_csv.dart' as _i729;
import 'package:kana_master/pages/dictionary/bloc/dictionary_bloc.dart'
    as _i963;
import 'package:kana_master/pages/learn/bloc/learn_bloc.dart' as _i990;
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart' as _i221;
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart' as _i593;
import 'package:kana_master/pages/study/bloc/material_bloc.dart' as _i222;
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart' as _i735;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i763.CheckMaterialAnswer>(() => _i763.CheckMaterialAnswer());
    gh.factory<_i735.TestKanaBloc>(() => _i735.TestKanaBloc());
    gh.lazySingleton<_i188.KanjiMeaningsLocalDataSource>(
        () => _i188.KanjiMeaningsLocalDataSource());
    gh.lazySingleton<_i258.MaterialCsvDataSource>(
        () => _i258.MaterialCsvDataSource());
    gh.lazySingleton<_i918.DatabaseProvider>(() => _i918.DatabaseProvider());
    gh.lazySingleton<_i863.MaterialRepository>(
        () => _i225.MaterialRepositoryImpl(gh<_i258.MaterialCsvDataSource>()));
    gh.factory<_i963.DictionaryBloc>(() => _i963.DictionaryBloc(
        dictionaryRepository: gh<_i592.DictionaryRepository>()));
    gh.factory<_i593.StatsBloc>(
        () => _i593.StatsBloc(scoreRepository: gh<_i867.ScoreRepository>()));
    gh.factory<_i221.SettingsBloc>(() =>
        _i221.SettingsBloc(settingsRepository: gh<_i816.SettingsRepository>()));
    gh.lazySingleton<_i439.KanjiLocalDataSource>(
        () => _i439.KanjiLocalDataSource(gh<_i918.DatabaseProvider>()));
    gh.lazySingleton<_i445.KanjiMeaningsRepository>(() =>
        _i1027.KanjiMeaningsRepositoryImpl(
            gh<_i188.KanjiMeaningsLocalDataSource>()));
    gh.factory<_i729.ImportMaterialCsv>(
        () => _i729.ImportMaterialCsv(gh<_i863.MaterialRepository>()));
    gh.factory<_i340.GetKanjiMeanings>(
        () => _i340.GetKanjiMeanings(gh<_i445.KanjiMeaningsRepository>()));
    gh.factory<_i222.MaterialBloc>(() => _i222.MaterialBloc(
          importMaterialCsv: gh<_i729.ImportMaterialCsv>(),
          checkMaterialAnswer: gh<_i763.CheckMaterialAnswer>(),
        ));
    gh.lazySingleton<_i785.KanjiRepository>(
        () => _i590.KanjiRepositoryImpl(gh<_i439.KanjiLocalDataSource>()));
    gh.factory<_i75.EnsureKanjiImported>(
        () => _i75.EnsureKanjiImported(gh<_i785.KanjiRepository>()));
    gh.factory<_i283.GetKanjiEntries>(
        () => _i283.GetKanjiEntries(gh<_i785.KanjiRepository>()));
    gh.factory<_i990.LearnBloc>(() => _i990.LearnBloc(
          ensureKanjiImported: gh<_i75.EnsureKanjiImported>(),
          getKanjiEntries: gh<_i283.GetKanjiEntries>(),
          getKanjiMeanings: gh<_i340.GetKanjiMeanings>(),
        ));
    return this;
  }
}
