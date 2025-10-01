import 'package:dio/dio.dart';
import 'package:tasky_app/core/services/dio_interceptor.dart';

class ApiServices {
  final Dio _dio = Dio();
  final DioInterceptor _dioInterceptor = DioInterceptor();

  Future get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    Response response = await _dioInterceptor.dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future post(
      {required String endPoint, Object? data}) async {
    Response response = await _dioInterceptor.dio.post(
      endPoint,
      data: data,
    );

    return response.data;
  }

  Future<void> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    _dioInterceptor.dio.put(
      endPoint,
      data: data,
    );
  }

  Future<void> delete({required String endPoint}) async {
    _dioInterceptor.dio.delete(endPoint);
  }
}
