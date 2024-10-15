import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project_webspark/config/routes/routes_constants.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final TextEditingController urlController = TextEditingController();
    return BlocConsumer<FindRouteBloc, FindRouteState>(
      listener: (context, state) {
        if (state is CountingState) {
          GoRouter.of(context).pushNamed(MyRoutes.processScreen);
        }
      },
      builder: (context, state) {
        return _buildHomeScreen(context, urlController);
      },
    );
  }

  Scaffold _buildHomeScreen(BuildContext context, TextEditingController  urlController) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home screen')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set valid API base URL in order to continue',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Row(
                  children: [
                    const Icon(Icons.sync_alt),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: TextField(
                          controller: urlController,
                          decoration: const InputDecoration(
                            label: Text('Enter URL'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  BlocProvider.of<FindRouteBloc>(context)
                      .add(StartCountingProcessEvent(urlController.text));
                },
                child: const Text('Start counting process'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
