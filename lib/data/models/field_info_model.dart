import 'package:test_project_webspark/domain/entities/field_info.dart';
import 'package:test_project_webspark/domain/entities/point.dart';

class FieldInfoModel extends FieldInfoEntity {
  String id;
  FieldInfoModel(
      {required super.fiendLenght,
      required super.field,
      required super.startPoint,
      required super.endPoint, required this.id});

    factory FieldInfoModel.fromJson(Map<String, dynamic> json) {
     List<List<bool>> field = (json['field'] as List<String>)
      .map((row) => row
          .split('') 
          .map((char) => char == '.' ? true : false)
          .toList()) 
      .toList();

    return FieldInfoModel(
      id: json['id'],
      fiendLenght: field.length, 
      field: field,
      startPoint: PointEntity(x: json['start']['x'], y: json['start']['y']),
      endPoint: PointEntity(x: json['end']['x'], y: json['end']['y']),
    );
  }
}
