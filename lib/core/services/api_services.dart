import 'package:dio/dio.dart';
import 'package:tasky_app/core/secrets/api_base_url.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future get({required String endPoint, String? authorization , Map<String, dynamic>? queryParameters }) async {
    Response response = await _dio.get(
      "$kBaseUrl$endPoint",
      queryParameters: queryParameters,
      options: authorization == null
          ? null
          : Options(
              headers: {
                'Authorization': 'Bearer $authorization}',
              },
            ),
    );
    return response.data;
  }

  Future post(
      {required String endPoint,
      Map<String, dynamic>? data,
      String? authorization}) async {
    Response response = await _dio.post(
      "$kBaseUrl$endPoint",
      data: data,
      options: authorization == null
          ? null
          : Options(
              headers: {
                'Authorization': 'Bearer $authorization',
              },
            ),
    );

    return response.data;
  }

  Future<void> put(
      {required String endPoint,
      required Map<String, dynamic> data,
      String? authorization}) async {
    _dio.put(
      "$kBaseUrl$endPoint",
      options: authorization == null
          ? null
          : Options(
              headers: {
                'Authorization': 'Bearer $authorization}',
              },
            ),
    );
  }

  Future<void> delete({required String endPoint, String? authorization}) async {
    _dio.delete(
      "$kBaseUrl$endPoint",
      options: authorization == null
          ? null
          : Options(
              headers: {
                'Authorization': 'Bearer $authorization}',
              },
            ),
    );
  }
}
