import 'point.dart';

class FieldInfoEntity {
  final int fiendLenght;
  final List<List<bool>> field;
  final PointEntity startPoint, endPoint;
  
  const FieldInfoEntity(
      {required this.fiendLenght,
      required this.field,
      required this.startPoint,
      required this.endPoint});
}
