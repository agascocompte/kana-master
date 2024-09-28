import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/di/dependency_injector.dart';
import 'package:hiragana_japanesse/pages/settings/bloc/settings_bloc.dart';
import 'package:hiragana_japanesse/pages/stats/bloc/stats_bloc.dart';
import 'package:hiragana_japanesse/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:hiragana_japanesse/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //debugPaintSizeEnabled = true;
  configureDependencies('dev');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<SettingsBloc>()),
        BlocProvider(create: (context) => sl<TestKanaBloc>()),
        BlocProvider(
            create: (context) => sl<StatsBloc>()..add(LoadMemoryStats())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Kana Master',
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routerDelegate: AppRouter.router.routerDelegate,
        locale: const Locale.fromSubtags(languageCode: 'es'),
      ),
    );
  }
}
