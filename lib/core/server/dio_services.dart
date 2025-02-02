import 'package:dio/dio.dart';

import '../extensions/constants.dart';

class DioServices {
  factory DioServices() => _instance;
  DioServices._internal()
      : _dio = Dio(
          BaseOptions(
            baseUrl: AppConstants.baseUrl,
            // connectTimeout: const Duration(seconds: 60),
            // receiveTimeout: const Duration(seconds: 60),
          ),
        );
  static final DioServices _instance = DioServices._internal();
  final Dio _dio;

  Dio get dio => _dio;

  Future<Response<dynamic>> getMethod(
    Map<String, dynamic> map,
    String url,
  ) async {
    dio.options.headers['content-Type'] = 'application/json';

    return dio
        .get<dynamic>(
      url,
      queryParameters: map,
      options: Options(responseType: ResponseType.json, method: 'GET'),
    )
        .then((response) {
      return response;
    });
  }

  Future<Response<dynamic>> postMethod(
    Map<String, dynamic> map,
    String url,
  ) async {
    dio.options.headers['content-Type'] = 'application/json';
    return dio
        .post<dynamic>(
      url,
      data: map,
      options: Options(responseType: ResponseType.json, method: 'POST'),
    )
        .then((response) {
      return response;
    });
  }
}
