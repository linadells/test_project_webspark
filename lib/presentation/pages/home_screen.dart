import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController urlController = TextEditingController();
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
