import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/core/services/auth_services.dart';
import 'package:tasky_app/core/services/data_service.dart';
import 'package:tasky_app/core/models/task_model.dart';

import '../../../../core/helper/api_keys.dart';
import '../../../../core/utils/shared_preference_singleton.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final DataService dataService;
  final AuthServices authServices;
  HomeRepoImpl({required this.authServices, required this.dataService});
  @override
  Future<Either<List<TaskModel>, Failure>> fetchAllTasks(
      {required int pageNum}) async {
    try {
      // String newAccessToken = await refreshToken();
      List<TaskModel> taskModel =
          await dataService.fetchTasks(pageNum: pageNum);
      return left(taskModel);
    } on DioException catch (e) {
      log("fetch data error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("fetch data error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }

  @override
  Future<String> refreshToken() async {
    String refreshToken =
        SharedPreferenceSingleton.getString(ApiKeys.refreshToken);
    String newAccessToken =
        await authServices.refreshToken(refreshToken: refreshToken);
    await SharedPreferenceSingleton.setString(
        ApiKeys.accessToken, newAccessToken);
    return newAccessToken;
  }

  @override
  Future<Either<TaskModel, Failure>> fetchOneTask(
      {required String qrData}) async {
    try {
      TaskModel taskModel = await dataService.fetchOneTask(qrData: qrData);
      return left(taskModel);
    } on DioException catch (e) {
      log("fetch one task error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("fetch one task error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }

  @override
  Future<Either<void, Failure>> deleteTask({required String taskId}) async {
    try {
      String newAccessToken = await refreshToken();
      await dataService.deleteTask(accessToken: newAccessToken, taskId: taskId);
      return left(null);
    } on DioException catch (e) {
      log("fetch one task error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("fetch one task error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }
}
