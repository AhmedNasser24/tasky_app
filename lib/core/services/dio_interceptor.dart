import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/secrets/api_base_url.dart';
import 'package:tasky_app/core/secrets/end_point.dart';
import 'package:tasky_app/core/utils/shared_preference_singleton.dart';

class DioInterceptor {
  late final Dio dio;

  DioInterceptor() {
    dio = Dio(BaseOptions(baseUrl: kBaseUrl));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        log("dio interceptor Request : ${options.path}");
        String accessToken =
            SharedPreferenceSingleton.getString(ApiKeys.accessToken);
        options.headers.addAll({"Authorization": "Bearer $accessToken"});
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log("dio interceptor Response ");
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        log("dio interceptor Error : ${e.toString()}");
        if (e.response?.statusCode == 401) {
          await refreshToken();
          String newAccessToken =
              SharedPreferenceSingleton.getString(ApiKeys.accessToken);
          final requestOptions = e.requestOptions;
          requestOptions.headers
              .addAll({"Authorization": "Bearer $newAccessToken"});

          // ⚠️ Check if the body was FormData
          if (requestOptions.data is FormData) {
            final oldFormData = requestOptions.data as FormData;
            final Map<String, dynamic> newMap = {};
            for (final entry in oldFormData.fields) {
              newMap[entry.key] = entry.value;
            }
            for (final entry in oldFormData.files) {
              final file = entry.value;
              newMap[entry.key] = await MultipartFile.fromFile(
                file.filename!,
                filename: file.filename,
                contentType: file.contentType,
              );
            }
            requestOptions.data = FormData.fromMap(newMap);
          }

          final response = await dio.fetch(requestOptions);
          return handler.resolve(response);
        }
        return handler.next(e);
      },
    ));
  }

  Future<void> refreshToken() async {
    try {
      String refreshToken =
          SharedPreferenceSingleton.getString(ApiKeys.refreshToken);
      var response = await dio.get(
        "${EndPoint.refreshToken}$refreshToken",
      );
      String newAccessToken = response.data[ApiKeys.accessToken];
      log("newAccessToken : $newAccessToken");
      SharedPreferenceSingleton.setString(ApiKeys.accessToken, newAccessToken);
      log("refresh token success");
    } catch (e) {
      log("refresh token error : ${e.toString()}");
    }
  }
}
