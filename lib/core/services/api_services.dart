
abstract class ApiServices {
  Future get({required String endPoint, Map<String, dynamic>? queryParameters});

  Future post({required String endPoint, Object? data, bool isAuth = false});

  Future<void> put(
      {required String endPoint, required Map<String, dynamic> data});

  Future<void> delete({required String endPoint});
}
