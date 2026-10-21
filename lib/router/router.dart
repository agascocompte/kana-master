import 'package:flutter/material.dart' hide MaterialPage;
import 'package:go_router/go_router.dart';
import 'package:kana_master/domain/exam/exam_models.dart';
import 'package:kana_master/pages/dictionary/dictionary.dart';
import 'package:kana_master/pages/exam/exam_session_page.dart';
import 'package:kana_master/pages/home/home.dart';
import 'package:kana_master/pages/premium/premium_page.dart';
import 'package:kana_master/pages/settings/settings.dart';
import 'package:kana_master/pages/stats/stats.dart';
import 'package:kana_master/pages/study/pages/learn_page.dart';
import 'package:kana_master/pages/study/pages/material_page.dart';
import 'package:kana_master/pages/study/pages/practice_page.dart';

class AppRouter {
  static const String homeRoute = "/home";
  static const String settingsRoute = "/settings";
  static const String statsRoute = "/stats";
  static const String learnRoute = "/learn";
  static const String practiceRoute = "/practice";
  static const String materialRoute = "/material";
  static const String premiumRoute = "/premium";
  static const String dictionaryRoute = "/dictionary";
  static const String examSessionRoute = "/exam/session";

  static GoRouter router = GoRouter(
    initialLocation: homeRoute,
    routes: <GoRoute>[
      GoRoute(
        path: "/home",
        name: homeRoute,
        builder: (BuildContext context, GoRouterState state) {
          return HomePage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: "/settings",
        name: settingsRoute,
        builder: (BuildContext context, GoRouterState state) {
          return SettingsPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: "/stats",
        name: statsRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(
            body: StatsTab(),
          );
        },
      ),
      GoRoute(
        path: "/learn",
        name: learnRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const LearnPage();
        },
      ),
      GoRoute(
        path: "/practice",
        name: practiceRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const PracticePage();
        },
      ),
      GoRoute(
        path: "/material",
        name: materialRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const MaterialPage();
        },
      ),
      GoRoute(
        path: "/premium",
        name: premiumRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const PremiumPage();
        },
      ),
      GoRoute(
        path: "/dictionary",
        name: dictionaryRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const DictionaryPage();
        },
      ),
      GoRoute(
        path: "/exam/session",
        name: examSessionRoute,
        builder: (BuildContext context, GoRouterState state) {
          return ExamSessionPage(
            sections: state.extra as List<ExamSection>,
          );
        },
      ),
    ],
  );
}
