import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiragana_japanesse/pages/home/home.dart';
import 'package:hiragana_japanesse/pages/settings/settings.dart';

class AppRouter {
  static const String homeRoute = "/home";
  static const String settingsRoute = "/settings";

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
    ],
  );
}
