import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_app/core/services/auth_services.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';

import '../../../../core/errors/failure.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthServices authServices;

  AuthRepoImpl({required this.authServices});
  @override
  Future<Either<void, Failure>> register(
      {required UserInfoModel userInfoModelInput}) async {
    try {
      UserInfoModel userInfoModelOutput =
          await authServices.register(userInfoModelInput: userInfoModelInput);
      // save to shared preferences
      return left(null);
    } on DioException catch (e) {
      log("register error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("register error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }
}
