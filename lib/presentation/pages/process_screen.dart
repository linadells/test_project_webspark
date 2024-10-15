import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';

class ProcessScreen extends StatelessWidget {
  String progressText = "Processing your resilts";
  double progress = 0.1;
  ProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<FindRouteBloc>(context).state;
    return Scaffold(
      appBar: AppBar(title: const Text('Process screen')),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(progressText),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: progress,
                      color: Colors.blue,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (state is ReadyResultState)
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<FindRouteBloc>(context)
                        .add(SendResultEvent(state.routeModels, state.fieldInfoModels));
                  },
                  child: const Text('Send results to server'),
                ),
              ),
            if (state is SendingResults)
              Center(
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
    );
  }
}
