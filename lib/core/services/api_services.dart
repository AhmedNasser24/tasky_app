import 'package:dio/dio.dart';
import 'package:tasky_app/core/secrets/api_base_url.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response = await _dio.get("$kBaseUrl$endPoint");
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    Response response = await _dio.post(
      "$kBaseUrl$endPoint",
      data: data,
    );

    return response.data;
  }

  Future<void> put(
      {required String endPoint, required Map<String, dynamic> data}) async {
    _dio.put("$kBaseUrl$endPoint");
  }

  Future<void> delete({required String endPoint}) async {
    _dio.delete("$kBaseUrl$endPoint");
  }
}
