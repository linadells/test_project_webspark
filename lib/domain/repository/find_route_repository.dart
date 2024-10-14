import 'package:flutter/material.dart';
import 'package:test_project_webspark/core/data_state.dart';
import 'package:test_project_webspark/domain/entities/field_info.dart';

abstract class FindRouteRepository {
  Future<DataState<List<FieldInfoEntity>>> getFieldInfo(
      {String baseUrl});
  Future<DataState<void>> sendResult(Route? route);
}
