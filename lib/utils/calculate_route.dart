import 'dart:math';

import 'package:test_project_webspark/domain/entities/cell.dart';
import 'package:test_project_webspark/domain/entities/field_info.dart';
import 'package:test_project_webspark/domain/entities/point.dart';
import 'package:test_project_webspark/domain/entities/route.dart';

class CalculateRoute {
  FieldInfoEntity field;
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

  int findCellIndex(List<Cell> cells, PointEntity thisPoint) {
    return cells.indexWhere((cell) => cell.point == thisPoint);
  }

  void calculateCellCosts(Cell cell) {
    int startX = cell.point.x - 1 >= 0 ? cell.point.x - 1 : cell.point.x;
    int startY = cell.point.y - 1 >= 0 ? cell.point.y - 1 : cell.point.y;
    int endX =
        cell.point.x + 1 < field.fiendLenght ? cell.point.x + 1 : cell.point.x;
    int endY =
        cell.point.y + 1 < field.fiendLenght ? cell.point.y + 1 : cell.point.y;

    for (int i = startX; i <= endX; i++) {
      for (int j = startY; j <= endY; j++) {
        PointEntity thisPoint = PointEntity(x: i, y: j);

        int ind = findCellIndex(cellsCosts, thisPoint);
        if (ind != -1) cellsCosts.removeAt(ind);

        if (thisPoint != field.startPoint &&
            field.field[i][j] &&
            findCellIndex(route, thisPoint) == -1) {
          double h = findDistance(field.endPoint, thisPoint);
          double g = (i == cell.point.x || j == cell.point.y) ? 1 : 1.414;
          route.fold(g, (sum, cell) => sum + cell.g);
          cellsCosts.add(Cell(point: thisPoint, f: g + h, g: g, h: h));
        }
      }
    }
  }

  Cell findNextPointOfRoute() {
    Cell minCell = cellsCosts.reduce((a, b) => a.f < b.f ? a : b);
    List<Cell> cellsWithMinF =
        cellsCosts.where((cell) => cell.f == minCell.f).toList();
    if (cellsWithMinF.length > 1)
      minCell = cellsCosts.reduce((a, b) => a.g < b.g ? a : b);
    return minCell;
  }

  RouteEntity AStartAlgo() {
    Cell currentCell = route.first;
    while (currentCell.point != field.endPoint) {
      calculateCellCosts(currentCell);
      currentCell = findNextPointOfRoute();
      if (currentCell.point != field.endPoint) route.add(currentCell);
    }
    return convertRoute();
  }

  RouteEntity convertRoute() {
    List<PointEntity> list = route.map((el) => el.point).toList();
    list.add(field.endPoint);
    return RouteEntity(route: list);
  }
}
