import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection time out with ApiServer');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send time out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Recieve time out with ApiServer');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return const ServerFailure('Your request is canceled');
      case DioExceptionType.connectionError:
        return const ServerFailure('No Network connection');
      case DioExceptionType.unknown:
        return const ServerFailure('unKnown Error');
    }
  }

  factory ServerFailure.fromBadResponse(
      int statusCode, Map<String, dynamic> errData) {
    if (statusCode == 403) {
      return ServerFailure(errData['message']);
    } else if (statusCode == 401) {
      if (errData['message'] == "يوجد خطأ في رقم الهاتف أو كلمة المرور") {
        return const ServerFailure("wrong phone number or password");
      } else if (errData['message'] == "Unauthorized") {
        return const ServerFailure("unauthorized");
      }
      return const ServerFailure("error , please try again");
    } else if (statusCode == 422) {
      if (errData['message'] == "رقم الهاتف مستخدم بالفعل") {
        return const ServerFailure("this phone is already in use");
      }
      return const ServerFailure("error , please try again");
    } else {
      return const ServerFailure("error , please try again");
    }
  }
}
