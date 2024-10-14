import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_webspark/core/styles.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';
import 'package:test_project_webspark/presentation/routes/router_config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FindRouteBloc(),
      child: MaterialApp.router(
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: MyAppRouter.returnRouter(false),
      ),
    );
  }
}
