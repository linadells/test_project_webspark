import 'package:dio/dio.dart';

class RouteApiService {
  final Dio _dio;
  const RouteApiService(this._dio);

  Future<Response> getData({
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(baseUrl,
        queryParameters: queryParameters,
        options: Options(headers: {
          'accept': 'application/json',
        }));
    return response;
  }

  Future<Response> sendData({
    required String baseUrl,
    required Map<String, dynamic> data,
  }) async {
    final response = await _dio.post(
      baseUrl,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      ),
    );
    return response;
  }
}
