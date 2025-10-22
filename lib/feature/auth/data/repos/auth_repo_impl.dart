import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../model/user_info_model.dart';
import '../../../../core/helper/api_keys.dart';
import '../data_source/auth_services_data_source.dart';
import '../../../../core/storage/shared_preference_singleton.dart';
import '../../domain/entities/user_info_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthServicesDataSource __authServicesDataSource;

  AuthRepoImpl({required AuthServicesDataSource authServicesDataSource})
      : __authServicesDataSource = authServicesDataSource;
  @override
  Future<Either<void, Failure>> register(
      {required UserInfoEntity userInfoEntityInput}) async {
    try {
      UserInfoModel userInfoModelInput = UserInfoModel.fromEntity(userInfoEntityInput);
      UserInfoEntity registerOutput =
          await __authServicesDataSource.register(userInfoModelInput: userInfoModelInput);
      await __saveUserInfoLocal(
          userInfoModelOutput: registerOutput, profile: userInfoEntityInput);
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
      {required UserInfoEntity loginEntityInput}) async {
    try {
      UserInfoModel loginModelInput = UserInfoModel.fromEntity(loginEntityInput);
      UserInfoEntity loginModelOutput =
          await __authServicesDataSource.login(loginModelInput: loginModelInput);
      await SharedPreferenceSingleton.setString(
          ApiKeys.userId, loginModelOutput.userId!);
      await SharedPreferenceSingleton.setString(
          ApiKeys.accessToken, loginModelOutput.accessToken!);
      await SharedPreferenceSingleton.setString(
          ApiKeys.refreshToken, loginModelOutput.refreshToken!);
      UserInfoEntity profile = await __authServicesDataSource.getProfile();
      await __saveUserInfoLocal(
          userInfoModelOutput: loginModelOutput, profile: profile);

      log("access toke after login : ${SharedPreferenceSingleton.getString(ApiKeys.accessToken)}");
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
      await __authServicesDataSource.logout();
      await removeUserInfoLocal();
      log("access toke after remove : ${SharedPreferenceSingleton.getString(ApiKeys.accessToken)}");
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
  Future<UserInfoEntity> profile(String accessToken) async {
    UserInfoEntity profile = await __authServicesDataSource.getProfile();
    return profile;
  }

  Future<void> __saveUserInfoLocal(
      {required UserInfoEntity userInfoModelOutput,
      required UserInfoEntity profile}) async {
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

  Future <void>removeUserInfoLocal() async {
    await SharedPreferenceSingleton.remove(ApiKeys.userId);
    await SharedPreferenceSingleton.remove(ApiKeys.accessToken);
    await SharedPreferenceSingleton.remove(ApiKeys.refreshToken);
    await SharedPreferenceSingleton.remove(ApiKeys.phone);
    await SharedPreferenceSingleton.remove(ApiKeys.displayName);
    await SharedPreferenceSingleton.remove(ApiKeys.address);
    await SharedPreferenceSingleton.remove(ApiKeys.level);
    await SharedPreferenceSingleton.remove(ApiKeys.experienceYears);
  }
}
