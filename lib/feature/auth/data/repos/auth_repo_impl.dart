import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/services/auth_services.dart';
import 'package:tasky_app/core/utils/shared_preference_singleton.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';

import '../../../../core/errors/failure.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthServices __authServices;

  AuthRepoImpl({required AuthServices authServices}) : __authServices = authServices;
  @override
  Future<Either<void, Failure>> register(
      {required UserInfoModel userInfoModelInput}) async {
    try {
      UserInfoModel registerOutput =
          await __authServices.register(userInfoModelInput: userInfoModelInput);
      await __saveUserInfoLocal(
          userInfoModelOutput: registerOutput,
          profile: userInfoModelInput);
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
      {required UserInfoModel loginModelInput}) async {
    try {
      UserInfoModel loginModelOutput =
          await __authServices.login(loginModelInput: loginModelInput);
      UserInfoModel profile = await __authServices.getProfile(accessToken: loginModelOutput.accessToken!);
      await __saveUserInfoLocal(userInfoModelOutput: loginModelOutput, profile: profile);    
      await SharedPreferenceSingleton.setString(
          ApiKeys.userId, loginModelOutput.userId!);
      await SharedPreferenceSingleton.setString(
          ApiKeys.accessToken, loginModelOutput.accessToken!);
      await SharedPreferenceSingleton.setString(
          ApiKeys.refreshToken, loginModelOutput.refreshToken!);
      return left(null);
    } on DioException catch (e) {
      log("login error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("login error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }

  

  @override
  Future<Either<void, Failure>> logout() async {
    try {
      await __authServices.logout();
      // remove access token & refresh token from local storage
      await SharedPreferenceSingleton.remove(ApiKeys.accessToken);
      await SharedPreferenceSingleton.remove(ApiKeys.refreshToken);
      //------------------------------------------------------------------
      return left(null);
    } on DioException catch (e) {
      log("log out error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("log out error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }

  @override
  Future < UserInfoModel > profile (String accessToken) async {
    UserInfoModel profile = await __authServices.getProfile(accessToken: accessToken);
    return profile;
  }

  Future<void> __saveUserInfoLocal(
      {required UserInfoModel userInfoModelOutput,
      required UserInfoModel profile}) async {
    await SharedPreferenceSingleton.setString(
        ApiKeys.userId, userInfoModelOutput.userId!);
    await SharedPreferenceSingleton.setString(
        ApiKeys.accessToken, userInfoModelOutput.accessToken!);
    await SharedPreferenceSingleton.setString(
        ApiKeys.refreshToken, userInfoModelOutput.refreshToken!);
    await SharedPreferenceSingleton.setString(ApiKeys.phone, profile.phone!);
    await SharedPreferenceSingleton.setString(
        ApiKeys.displayName, profile.userName!);
    await SharedPreferenceSingleton.setString(
        ApiKeys.address, profile.address!);
    await SharedPreferenceSingleton.setString(
        ApiKeys.level, profile.experienceLevel!);
    await SharedPreferenceSingleton.setInt(
        ApiKeys.experienceYears, profile.yearsOfExperience!);
  }
}
