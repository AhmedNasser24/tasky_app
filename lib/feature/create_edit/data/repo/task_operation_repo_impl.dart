import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:tasky_app/core/errors/failure.dart';

import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/core/secrets/api_base_url.dart';
import 'package:tasky_app/core/services/data_service.dart';
import 'task_operation_repo.dart';

class TaskOperationRepoImpl extends TaskOperationRepo {
  final DataService dataService;

  TaskOperationRepoImpl(
      {required this.dataService});
      
  @override
  Future<Either<void, Failure>> createTask(
      {required TaskModel taskModel}) async {
    try {
      String imageUrl = await uploadImage(image: taskModel.imageFile!);
      taskModel.image = imageUrl;
      await dataService.createTask(taskModel: taskModel);
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
      if (taskModel.imageFile != null) {
        String imageUrl = await uploadImage(image: taskModel.imageFile!);
        taskModel.image = imageUrl;
      }
      await dataService.editTask( taskModel: taskModel);
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
  Future<String> uploadImage({required File image}) async {
    String imagePath = await dataService.uploadImage(imageFile: image);
    String imageUrl = "$kBaseUrl/images/$imagePath";
    return imageUrl;
  }
}
