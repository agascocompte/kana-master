import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiragana_japanesse/pages/home/home.dart';

class AppRouter {  
  static const String homeRoute = "/home";  

  static GoRouter router = GoRouter(
    initialLocation: homeRoute,
    routes: <GoRoute>[
      // GoRoute(
      //   path: "/login",
      //   name: loginRoute,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return LoginPage(
      //       key: state.pageKey,
      //     );
      //   },
      // ),
      GoRoute(
        path: "/home",
        name: homeRoute,
        builder: (BuildContext context, GoRouterState state) {
          return HomePage(
            key: state.pageKey,
          );
        },
      ),      
    ],
  );
}