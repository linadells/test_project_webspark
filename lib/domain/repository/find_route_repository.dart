import 'package:test_project_webspark/core/data_state.dart';
import 'package:test_project_webspark/domain/entities/field_info.dart';
import 'package:test_project_webspark/domain/entities/route.dart';

abstract class FindRouteRepository {
  Future<DataState<List<FieldInfoEntity>>> getFieldInfo({String baseUrl});
  Future<List<RouteEntity>> calculateRoutes({List<FieldInfoEntity> fields});
  Future<DataState<void>> sendResult(RouteEntity? route);
}
