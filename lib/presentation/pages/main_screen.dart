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
          print(state);
          if (state is CountingState ||
              state is ReadyResultState ||
              state is SendingResults) {
            GoRouter.of(context).pushNamed(MyRoutes.processScreen);
          } else if (state is ResultIsSended) {
            GoRouter.of(context).pushNamed(MyRoutes.resultListScreen);
          } else if (state is DetailedResultState) {
            GoRouter.of(context).pushNamed(MyRoutes.previewScreen);
          } else if (state is ErrorFindRouteState ||
              state is ErrorInSendingResultsState) {
            String errorMessage = '';
            if (state is ErrorFindRouteState) {
              errorMessage = (state as ErrorFindRouteState).error.toString();
            } else if (state is ErrorInSendingResultsState) {
              errorMessage =
                  (state as ErrorInSendingResultsState).error.toString();
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: Text('An error occurred: ${errorMessage}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (state is ErrorFindRouteState) {
                            Navigator.of(context).pop();
                            BlocProvider.of<FindRouteBloc>(context).apiUrl=null;
                            GoRouter.of(context).pushNamed(MyRoutes.mainScreen);
                          } else if (state is ErrorInSendingResultsState) {
                            BlocProvider.of<FindRouteBloc>(context).add(
                                ViewResultsEvent(
                                    state.routeModels, state.fieldInfoModels));
                          }
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            });
          }
        },
        child: HomeScreen());
  }
}
