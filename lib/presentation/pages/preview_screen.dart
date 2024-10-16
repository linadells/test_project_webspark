import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project_webspark/config/routes/routes_constants.dart';
import 'package:test_project_webspark/domain/entities/point.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<FindRouteBloc>(context).state;
    if (state is DetailedResultState) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Preview screen'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              BlocProvider.of<FindRouteBloc>(context).add(
                  ViewResultsEvent(state.routeModels, state.fieldInfoModels));
              GoRouter.of(context).pop();
            },
          ),
        ),
        body: Column(
          children: [
            Flexible(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      state.fieldInfoModels[state.index].fiendLenght,
                  childAspectRatio: 1.0,
                ),
                itemCount: state.fieldInfoModels[state.index].fiendLenght *
                    state.fieldInfoModels[state.index].fiendLenght,
                itemBuilder: (context, index) {
                  int x =
                      index % state.fieldInfoModels[state.index].fiendLenght;
                  int y =
                      index ~/ state.fieldInfoModels[state.index].fiendLenght;
                  Color color;
                  if (state.fieldInfoModels[state.index].endPoint ==
                      PointEntity(x: x, y: y)) {
                    color = Color(0xFF009688);
                  } else if (state.fieldInfoModels[state.index].startPoint ==
                      PointEntity(x: x, y: y)) {
                    color = Color(0xFF64FFDA);
                  } else if (state.routeModels[state.index].route
                      .contains(PointEntity(x: x, y: y))) {
                    color = Color(0xFF4CAF50);
                  } else if (!state.fieldInfoModels[state.index].field[x][y]) {
                    color = Color(0xFF000000);
                  } else {
                    color = Color(0xFFFFFFFF);
                  }

                  return Container(
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    alignment: Alignment.center,
                    child: Text('($x,$y)',
                        style: TextStyle(
                            fontSize: 16,
                            color: color == Color(0xFF000000)
                                ? Color(0xFFFFFFFF)
                                : Color(0xFF000000))),
                  );
                },
              ),
            ),
            Expanded(
              child: Text(
                state.routeModels[state.index].toString(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            )
          ],
        ),
      );
    }
    return Center(child: Text('Error of definding state in preview screen'));
  }
}
