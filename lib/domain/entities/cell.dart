import 'package:test_project_webspark/domain/entities/point.dart';

class Cell {
  PointEntity point;
  double f, g, h;
  bool start, end;
  Cell(
      {required this.point,
      required this.f,
      required this.g,
      required this.h,
      this.start = false,
      this.end = false});
}
