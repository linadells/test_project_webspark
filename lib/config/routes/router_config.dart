import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:test_project_webspark/presentation/pages/home_screen.dart';
import 'package:test_project_webspark/presentation/pages/main_screen.dart';
import 'package:test_project_webspark/presentation/pages/preview_screen.dart';
import 'package:test_project_webspark/presentation/pages/process_screen.dart';
import 'package:test_project_webspark/config/routes/routes_constants.dart';
import 'package:test_project_webspark/presentation/pages/result_list_screen.dart';

class MyAppRouter {
  static GoRouter returnRouter(bool isAuth) {
    return GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          name: MyRoutes.mainScreen,
          path: '/',
          pageBuilder: (context, state) => MaterialPage(
            child: const MainScreen(),
            key: state.pageKey,
          ),
        ),
        GoRoute(
          name: MyRoutes.homeScreen,
          path: '/home',
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
        GoRoute(
          name: MyRoutes.resultListScreen,
          path: '/resultList',
          pageBuilder: (context, state) => MaterialPage(
            child: ResultListScreen(),
            key: state.pageKey,
          ),
        ),
        GoRoute(
          name: MyRoutes.previewScreen,
          path: '/preview',
          pageBuilder: (context, state) => MaterialPage(
            child: PreviewScreen(),
            key: state.pageKey,
          ),
        ),
      ],
    );
  }
}