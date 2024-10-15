import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project_webspark/config/routes/routes_constants.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';
import 'package:test_project_webspark/presentation/pages/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController urlController = TextEditingController();
    return BlocListener<FindRouteBloc, FindRouteState>(
        listener: (context, state) {
          if (state is CountingState) {
            GoRouter.of(context).pushNamed(MyRoutes.processScreen);
          } else if (state is ReadyResultState) {
            GoRouter.of(context).pushNamed(MyRoutes.resultListScreen);
          } else if (state is DetailedResultState) {
            GoRouter.of(context).pushNamed(MyRoutes.previewScreen);
          }
        },
        child: HomeScreen());
  }
}
