import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';

class ResultListScreen extends StatelessWidget {
  const ResultListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<FindRouteBloc>(context).state;
    if (state is ReadyResultState) {
      return Scaffold(
        appBar: AppBar(title: const Text('Process screen')),
        body: ListView.separated(
            itemCount: state.routeModels.length,
            separatorBuilder: (context, index) =>
                Divider(height: 20, thickness: 2),
            itemBuilder: (context, index) {
              return ListTile(
                title: GestureDetector(
                  onTap: () => BlocProvider.of<FindRouteBloc>(context).add(
                      ViewDetailsOfRouteEvent(state.routeModels[index],
                          state.fieldInfoModels[index])),
                  child: Center(
                      child: Text(
                    state.routeModels[index].toString(),
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
                ),
              );
            }),
      );
    }
    return Center(child: Text('Error of definding state'));
  }
}
