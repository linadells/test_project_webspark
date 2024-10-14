import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:test_project_webspark/core/data_state.dart';
import 'package:test_project_webspark/data/data_sources.dart/route_api_service.dart';
import 'package:test_project_webspark/data/models/field_info_model.dart';
import 'package:test_project_webspark/domain/repository/find_route_repository.dart';

class FindRouteRepositoryImpl implements FindRouteRepository {
  final RouteApiService _routeApiService;

  const FindRouteRepositoryImpl(this._routeApiService);

  @override
  Future<DataState<List<FieldInfoModel>>> getFieldInfo(
      {String? baseUrl}) async {
    Response res;
    if(baseUrl==null) throw Exception("Empty url");
    try {
      Map<String, dynamic> queryParams = Uri.parse(baseUrl).queryParameters;

      res = await _routeApiService.getData(
          baseUrl: baseUrl, queryParameters: queryParams);

      if (res.statusCode == 200) {
        List<FieldInfoModel> fieldInfoList = (res.data as List)
            .map(
                (item) => FieldInfoModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return DataSuccess<List<FieldInfoModel>>(data: fieldInfoList);
      } else {
        return DataFailed(
            error: DioException(
                requestOptions: RequestOptions(),
                error: res.statusMessage,
                response: res,
                type: DioExceptionType.badResponse));
      }
    } catch (e) {
      return DataFailed(
          error: DioException(
              requestOptions: RequestOptions(),
              error: e.toString(),
              type: DioExceptionType.badResponse));
    }
  }

  @override
  Future<DataState<void>> sendResult(Route? route) {
    // TODO: implement sendResult
    throw UnimplementedError();
  }
}
