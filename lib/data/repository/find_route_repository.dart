import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:test_project_webspark/core/data_state.dart';
import 'package:test_project_webspark/data/data_sources.dart/route_api_service.dart';
import 'package:test_project_webspark/data/models/field_info_model.dart';
import 'package:test_project_webspark/data/models/route_model.dart';
import 'package:test_project_webspark/domain/entities/field_info.dart';
import 'package:test_project_webspark/domain/entities/route.dart';
import 'package:test_project_webspark/domain/repository/find_route_repository.dart';
import 'package:test_project_webspark/utils/calculate_route.dart';

class FindRouteRepositoryImpl implements FindRouteRepository {
  final RouteApiService _routeApiService;
  String? url;

  FindRouteRepositoryImpl(this._routeApiService);

  @override
  Future<DataState<List<FieldInfoModel>>> getFieldInfo(
      {String? baseUrl}) async {
    Response res;
    if (baseUrl == null) throw Exception("Empty url");
    try {
      final List<String> parts = baseUrl.split('/');

      final String host = parts[0];
      final String path = parts.sublist(1).join('/');
      final Uri uri = Uri.https(host, path);

      url = uri.toString();

      res = await _routeApiService.getData(
          baseUrl: uri.toString(), queryParameters: uri.queryParameters);

      if (res.statusCode == 200) {
        List<FieldInfoModel> fieldInfoList = (res.data['data'] as List)
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
  Future<DataState<void>> sendResult(RouteEntity? route) async {
    try {
      Response res;
      if (route is RouteModel) {
        if (route == null) throw Exception("Empty route");

        res = await _routeApiService.sendData(
            baseUrl: url!, data: route.toJson());

        if (res.statusCode == 200 && res.data['data']['0']['correct'] == true)
          return DataSuccess<void>(data: res);
        else {
          return DataFailed(
              error: DioException(
                  requestOptions: RequestOptions(),
                  error: res.statusMessage,
                  response: res,
                  type: DioExceptionType.badResponse));
        }
      } else
        throw Exception('Incorrect parameters');
    } catch (e) {
      return DataFailed(
          error: DioException(
              requestOptions: RequestOptions(),
              error: e.toString(),
              type: DioExceptionType.badResponse));
    }
  }

  @override
  Future<List<RouteModel>> calculateRoutes(
      {List<FieldInfoEntity>? fields}) async {
    List<RouteModel> res = [];
    if (fields is List<FieldInfoModel>) {
      if (fields.isEmpty) throw Exception('Empty field');

      CalculateRoute calculateRoute;

      for (FieldInfoModel field in fields) {
        calculateRoute = CalculateRoute(field: field);
        calculateRoute.AStartAlgo();
        res.add(
            RouteModel(route: calculateRoute.AStartAlgo().route, id: field.id));
      }
    }
    return res;
  }
}
