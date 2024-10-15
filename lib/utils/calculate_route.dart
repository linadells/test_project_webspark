import 'dart:math';

import 'package:test_project_webspark/data/models/field_info_model.dart';
import 'package:test_project_webspark/domain/entities/cell.dart';
import 'package:test_project_webspark/domain/entities/point.dart';

class CalculateRoute {
  FieldInfoModel field;
  List<Cell> cellsCosts = [];
  List<Cell> route = [];
  CalculateRoute({required this.field}) {
    double f = findDistance(field.startPoint, field.endPoint);
    route.add(Cell(point: field.startPoint, f: f, g: 0, h: f, start: true));
  }

  double findDistance(PointEntity point1, PointEntity point2) {
    return sqrt((point2.x - point1.x) * (point2.x - point1.x) +
        (point2.y - point1.y) * (point2.y - point1.y));
  }

  void calculateCellCosts(Cell cell) {
    int startX = cell.point.x - 1 >= 0 ? cell.point.x - 1 : cell.point.x;
    int startY = cell.point.y - 1 >= 0 ? cell.point.y - 1 : cell.point.y;
    int endX = cell.point.x + 1 <= 100 ? cell.point.x + 1 : cell.point.x;
    int endY = cell.point.y + 1 <= 100 ? cell.point.y + 1 : cell.point.y;

    for (int i = startX; i <= endX; i++) {
      for (int j = startY; j <= endY; j++) {
        PointEntity thisPoint = new PointEntity(x: i, y: j);
        double h = findDistance(field.endPoint, thisPoint);
        double g = (i == startX || j == startY) ? 1 : 1.4;
        route.fold(g, (sum, cell) => sum + cell.g);
        cellsCosts.add(Cell(point: thisPoint, f: g + h, g: g, h: h));
      }
    }
  }

  void findNextPointOfRoute() {
    Cell minCell = cellsCosts.reduce((a, b) => a.f < b.f ? a : b);
    List<Cell> cellsWithMinF =
        cellsCosts.where((cell) => cell.f == minCell.f).toList();
  }

  void AStartAlgo() {}
}
