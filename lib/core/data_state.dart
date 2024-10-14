import 'package:dio/dio.dart';
import 'package:test_project_webspark/data/models/field_info_model.dart';

abstract class DataState<T>{
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T>{
  const DataSuccess({required T data}): super(data: data);
}

class DataFailed<T> extends DataState<T>{
const DataFailed({required DioException error}): super(error: error);
}