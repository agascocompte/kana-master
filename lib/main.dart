import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kana_master/di/dependency_injector.dart';
import 'package:kana_master/i18n/strings.g.dart';
import 'package:kana_master/pages/premium/bloc/premium_bloc.dart';
import 'package:kana_master/pages/home/bloc/home_nav_cubit.dart';
import 'package:kana_master/pages/dictionary/bloc/dictionary_bloc.dart';
import 'package:kana_master/pages/settings/bloc/settings_bloc.dart';
import 'package:kana_master/pages/stats/bloc/stats_bloc.dart';
import 'package:kana_master/pages/test_kana/bloc/test_kana_bloc.dart';
import 'package:kana_master/router/router.dart';
import 'package:kana_master/services/ads/interstitial_gate.dart';
import 'package:kana_master/services/reminders/reminder_service.dart';
import 'package:kana_master/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //debugPaintSizeEnabled = true;

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  configureDependencies('dev');
  await MobileAds.instance.initialize();
  await InterstitialGate.instance.initialize();
  await ReminderService.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<SettingsBloc>()..add(LoadSettings())),
        BlocProvider(
            create: (context) => PremiumBloc(settingsRepository: sl())
              ..add(const PremiumStarted())),
        BlocProvider(create: (context) => sl<TestKanaBloc>()),
        BlocProvider(
            create: (context) => sl<StatsBloc>()..add(LoadMemoryStats())),
        BlocProvider(create: (context) => sl<DictionaryBloc>()),
        BlocProvider(create: (context) => HomeNavCubit()),
      ],
      child: TranslationProvider(
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'KanaGo',
              theme: AppTheme.build(Brightness.light),
              darkTheme: AppTheme.build(Brightness.dark),
              themeMode: context.select(
                  (SettingsBloc bloc) => bloc.state.stateData.themeMode),
              // Screens read AppColors directly, so set the palette before
              // they build and rebuild everything when the system switches
              // between light and dark.
              builder: (context, child) {
                final brightness = Theme.of(context).brightness;
                AppColors.setBrightness(brightness);
                return KeyedSubtree(
                  key: ValueKey(brightness),
                  child: child ?? const SizedBox.shrink(),
                );
              },
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              routeInformationParser: AppRouter.router.routeInformationParser,
              routeInformationProvider:
                  AppRouter.router.routeInformationProvider,
              routerDelegate: AppRouter.router.routerDelegate,
            );
          },
        ),
      ),
    );
  }
}
