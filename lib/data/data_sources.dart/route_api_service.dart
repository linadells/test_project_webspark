import 'package:dio/dio.dart';

class RouteApiService {
  final Dio _dio;
  const RouteApiService(this._dio);

  void setBaseUrl(String url) {
    _dio.options.baseUrl = url;
  }

  Future<Response> getData({
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
        baseUrl,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'accept': 'application/json',
          }
        )
      );
      return response;
  }
}
