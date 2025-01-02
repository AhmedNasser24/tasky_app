import 'dart:developer';

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
        return const ServerFailure('Network connection error');
      case DioExceptionType.unknown:
        return const ServerFailure('unKnown Error');
      default:
        return const ServerFailure('Opps , unExcepected error');
    }
  }

  factory ServerFailure.fromBadResponse(
      int statusCode, Map<String, dynamic> errData) {
    if (statusCode == 404) {
      return const ServerFailure('Not found');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return const ServerFailure("invalid email or password");
    } else {
      return const ServerFailure('Unknown bad response');
    }
  }
}
