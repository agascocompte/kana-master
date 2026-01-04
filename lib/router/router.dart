import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kana_master/pages/home/home.dart';
import 'package:kana_master/pages/settings/settings.dart';
import 'package:kana_master/pages/stats/stats.dart';

class AppRouter {
  static const String homeRoute = "/home";
  static const String settingsRoute = "/settings";
  static const String statsRoute = "/stats";

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
          return Scaffold(
            appBar: AppBar(
              title: const Text('Stats'),
            ),
            body: const StatsTab(),
          );
        },
      ),
    ],
  );
}
