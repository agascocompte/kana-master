// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hiragana_japanesse/domain/repositories/score_repository.dart'
    as _i754;
import 'package:hiragana_japanesse/pages/settings/bloc/settings_bloc.dart'
    as _i391;
import 'package:hiragana_japanesse/pages/stats/bloc/stats_bloc.dart' as _i15;
import 'package:hiragana_japanesse/pages/test_kana/bloc/test_kana_bloc.dart'
    as _i1050;
import 'package:injectable/injectable.dart' as _i526;

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
    gh.factory<_i391.SettingsBloc>(() => _i391.SettingsBloc());
    gh.factory<_i1050.TestKanaBloc>(() => _i1050.TestKanaBloc());
    gh.factory<_i15.StatsBloc>(
        () => _i15.StatsBloc(scoreRepository: gh<_i754.ScoreRepository>()));
    return this;
  }
}
