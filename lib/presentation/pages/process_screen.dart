import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';

class ProcessScreen extends StatelessWidget {
  ProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<FindRouteBloc>(context).state;
    return Scaffold(
      appBar: AppBar(title: const Text('Process screen')),
      body: BlocBuilder<FindRouteBloc, FindRouteState>(
        builder: (context, state) {
          if (state is CountingState)
            return _buildColumnForCountingState(context, state);
          else if (state is ReadyResultState) {
            return _buildColumnForReadyResultState(context, state);
          } else
            return const Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }

  Column _buildColumnForReadyResultState(
      BuildContext context, ReadyResultState state) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Text(
                      textAlign: TextAlign.center,
                      'All calculations has finished, you can send your results to server',
                      style: Theme.of(context).textTheme.displayMedium),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                Text('100%', style: Theme.of(context).textTheme.displayLarge),
                Container(
                  margin: EdgeInsets.all(10),
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: 100,
                      color: Colors.blue,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                BlocProvider.of<FindRouteBloc>(context).add(
                    SendResultEvent(state.routeModels, state.fieldInfoModels));
              },
              child: const Text('Send results to server'),
            ),
          ),
        ),
      ],
    );
  }

  Center _buildColumnForCountingState(
      BuildContext context, CountingState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            'Calculating results',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          Text('${(state.progress * 100).toStringAsFixed(2)}%',
              style: Theme.of(context).textTheme.displayLarge),
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: state.progress,
              color: Colors.blue,
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
