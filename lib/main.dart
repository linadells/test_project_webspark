import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_webspark/core/styles.dart';
import 'package:test_project_webspark/injection_container.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';
import 'package:test_project_webspark/config/routes/router_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FindRouteBloc>(
      create: (context) => sl(),
      child: MaterialApp.router(
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: MyAppRouter.returnRouter(false),
      ),
    );
  }
}
