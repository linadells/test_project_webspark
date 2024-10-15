import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_webspark/domain/entities/point.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<FindRouteBloc>(context).state;
    if (state is DetailedResultState) {
      return Scaffold(
        appBar: AppBar(title: const Text('Preview screen'), leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context); 
          },
        ),),
        body: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: state.fieldInfoModel.fiendLenght,
                childAspectRatio: 1.0,
              ),
              itemCount: state.fieldInfoModel.fiendLenght *
                  state.fieldInfoModel.fiendLenght,
              itemBuilder: (context, index) {
                int x = index % state.fieldInfoModel.fiendLenght;
                int y = index ~/ state.fieldInfoModel.fiendLenght;
                Color color;
                if (state.fieldInfoModel.endPoint == PointEntity(x: x, y: y)) {
                  color = Color(0xFF009688);
                } else if (state.fieldInfoModel.startPoint ==
                    PointEntity(x: x, y: y)) {
                  color = Color(0xFF64FFDA);
                } else if (state.routeModel.route
                    .contains(PointEntity(x: x, y: y))) {
                  color = Color(0xFF4CAF50);
                } else if (!state.fieldInfoModel.field[x][y]) {
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
            Center(child: Text(state.routeModel.toString()),)
          ],
        ),
      );
    }
    return Center(child: Text('Error of definding state'));
  }
}
