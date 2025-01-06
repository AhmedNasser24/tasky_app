import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/services/auth_services.dart';
import 'package:tasky_app/core/utils/shared_preference_singleton.dart';
import 'package:tasky_app/feature/auth/data/model/login_model.dart';
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
      await SharedPreferenceSingleton.setString(
          ApiKeys.userId, userInfoModelOutput.userId!);
      await SharedPreferenceSingleton.setString(
          ApiKeys.accessToken, userInfoModelOutput.accessToken!);
      await SharedPreferenceSingleton.setString(
          ApiKeys.refreshToken, userInfoModelOutput.refreshToken!);
      return left(null);
    } on DioException catch (e) {
      log("register error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("register error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }

  @override
  Future<Either<void, Failure>> login(
      {required LoginModel loginModelInput}) async {
    try {
      LoginModel loginModelOutput =
          await authServices.login(loginModelInput: loginModelInput);
      await SharedPreferenceSingleton.setString(
          ApiKeys.userId, loginModelOutput.userId!);
      await SharedPreferenceSingleton.setString(
          ApiKeys.accessToken, loginModelOutput.accessToken!);
      await SharedPreferenceSingleton.setString(
          ApiKeys.refreshToken, loginModelOutput.refreshToken!);
      return left(null);
    } on DioException catch (e) {
      log("register error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("register error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }

  @override
  Future<Either<void, Failure>> refreshToken() async {
    try {
      String refreshToken =
          SharedPreferenceSingleton.getString(ApiKeys.refreshToken);
      String newAccessToken =
          await authServices.refreshToken(refreshToken: refreshToken);
      await SharedPreferenceSingleton.setString(
          ApiKeys.accessToken, newAccessToken);
      return left(null);
    } on DioException catch (e) {
      log("refresh token error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("refresh token error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }
}
