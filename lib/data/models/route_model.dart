import 'package:test_project_webspark/domain/entities/route.dart';

class RouteModel extends RouteEntity {
  String id;
  RouteModel({required super.route, required this.id});

  @override
  String toString() {
    return route.map((r) => r.toString()).join('->');
  }

  Map<String, dynamic> toJson() {
    List<Map<String, String>> steps = route.map((point) {
      return {
        'x': point.x.toString(),
        'y': point.y.toString(),
      };
    }).toList();

    String path = steps.map((step) => "(${step['x']},${step['y']})").join("->");

    return {
      'id': id,
      'result': {
        'steps': steps,
        'path': path,
      },
    };
  }
}
