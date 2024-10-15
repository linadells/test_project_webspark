import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:test_project_webspark/presentation/pages/home_screen.dart';
import 'package:test_project_webspark/presentation/pages/process_screen.dart';
import 'package:test_project_webspark/config/routes/routes_constants.dart';

class MyAppRouter {
  static GoRouter returnRouter(bool isAuth) {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          name: MyRoutes.homeScreen,
          path: '/',
          pageBuilder: (context, state) => MaterialPage(
            child: const HomeScreen(),
            key: state.pageKey,
          ),
        ),
        GoRoute(
          name: MyRoutes.processScreen,
          path: '/process',
          pageBuilder: (context, state) => MaterialPage(
            child: ProcessScreen(),
            key: state.pageKey,
          ),
        ),
      ],
    );
  }
}