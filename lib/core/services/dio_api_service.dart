import 'package:dio/dio.dart';
import '../secrets/api_base_url.dart';
import 'api_services.dart';
import 'dio_interceptor.dart';

class DioApiServices extends ApiServices {
  final DioInterceptor _dioInterceptor = DioInterceptor();
  final Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
  ));
  @override
  Future get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    Response response = await _dioInterceptor.dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future post(
      {required String endPoint, Object? data, bool isAuth = false}) async {
    if (isAuth) {
      Response response = await dio.post(
        "$kBaseUrl$endPoint",
        data: data,
      );
      return response.data;
    } else {
      Response response = await _dioInterceptor.dio.post(
        endPoint,
        data: data,
      );

      return response.data;
    }
  }

  @override
  Future<void> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    _dioInterceptor.dio.put(
      endPoint,
      data: data,
    );
  }

  @override
  Future<void> delete({required String endPoint}) async {
    _dioInterceptor.dio.delete(endPoint);
  }
}
