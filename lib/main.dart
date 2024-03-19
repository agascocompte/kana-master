import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiragana_japanesse/di/dependency_injector.dart';
import 'package:hiragana_japanesse/pages/test_hiragana/bloc/test_hiragana_bloc.dart';
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
        BlocProvider(create: (context) => sl<TestHiraganaBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Hiragana',
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routerDelegate: AppRouter.router.routerDelegate,
        locale: const Locale.fromSubtags(languageCode: 'es'),
      ),
    );
  }
}
