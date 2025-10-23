import 'package:dio/dio.dart';
import 'api_consumer.dart';

class DioConsumer extends ApiConsumer {
  DioConsumer({required this.dio});
  final Dio dio;
  final Dio normalDio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
  ));

  @override
  Future get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    Response response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future post({required String endPoint, Object? data}) async {
    Response response = await dio.post(
      endPoint,
      data: data,
    );

    return response.data;
  }

  @override
  Future<void> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    dio.put(
      endPoint,
      data: data,
    );
  }

  @override
  Future<void> delete({required String endPoint}) async {
    dio.delete(endPoint);
  }
}
