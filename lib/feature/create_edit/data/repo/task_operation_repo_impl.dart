import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:tasky_app/core/errors/failure.dart';

import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/core/secrets/api_base_url.dart';
import 'package:tasky_app/core/services/auth_services.dart';
import 'package:tasky_app/core/services/data_service.dart';

import '../../../../core/helper/api_keys.dart';
import '../../../../core/utils/shared_preference_singleton.dart';
import 'task_operation_repo.dart';

class TaskOperationRepoImpl extends TaskOperationRepo {
  final DataService __dataService;
  final AuthServices __authServices;

  TaskOperationRepoImpl(
      {required DataService dataService, required AuthServices authServices})
      : __authServices = authServices,
        __dataService = dataService;
  @override
  Future<Either<void, Failure>> createTask(
      {required TaskModel taskModel}) async {
    try {
      String newAccessToken = await refreshToken();
      String imageUrl = await uploadImage(image: taskModel.imageFile!);
      taskModel.image = imageUrl;
      await __dataService.createTask(
          accessToken: newAccessToken, taskModel: taskModel);
      return left(null);
    } on DioException catch (e) {
      log("create task error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("create task error : ${e.toString()}");
      return right(const ServerFailure("Error , please try again"));
    }
  }

  @override
  Future<Either<void, Failure>> editTask({required TaskModel taskModel}) async {
    try {
      String newAccessToken = await refreshToken();
      if (taskModel.imageFile != null) {
        String imageUrl = await uploadImage(image: taskModel.imageFile!);
        taskModel.image = imageUrl;
      }
      await __dataService.editTask(
          accessToken: newAccessToken, taskModel: taskModel);
      return left(null);
    } on DioException catch (e) {
      log("edit task error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("edit task error : ${e.toString()}");
      return right(const ServerFailure("Error , please try again"));
    }
  }

  @override
  Future<String> refreshToken() async {
    String refreshToken =
        SharedPreferenceSingleton.getString(ApiKeys.refreshToken);
    String newAccessToken =
        await __authServices.refreshToken(refreshToken: refreshToken);
    await SharedPreferenceSingleton.setString(
        ApiKeys.accessToken, newAccessToken);
    return newAccessToken;
  }

  @override
  Future<String> uploadImage({required File image}) async {
    String newAccessToken = await refreshToken();
    String imagePath = await __dataService.uploadImage(
        accessToken: newAccessToken, imageFile: image);
    String imageUrl = "$kBaseUrl/images/$imagePath";
    return imageUrl;
  }
}
