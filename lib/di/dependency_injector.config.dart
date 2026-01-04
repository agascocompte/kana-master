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
import 'package:kana_master/domain/repositories/score_repository.dart' as _i867;
import 'package:kana_master/domain/repositories/settings_repository.dart'
    as _i816;
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart' as _i221;
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart' as _i593;
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
    gh.factory<_i735.TestKanaBloc>(() => _i735.TestKanaBloc());
    gh.factory<_i593.StatsBloc>(
        () => _i593.StatsBloc(scoreRepository: gh<_i867.ScoreRepository>()));
    gh.factory<_i221.SettingsBloc>(() =>
        _i221.SettingsBloc(settingsRepository: gh<_i816.SettingsRepository>()));
    return this;
  }
}
