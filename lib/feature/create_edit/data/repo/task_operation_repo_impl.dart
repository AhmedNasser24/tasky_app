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

  TaskOperationRepoImpl({required this.dataService});

  @override
  Future<Either<List<TaskModel>, Failure>> fetchAllTasks(
      {required int pageNum}) async {
    try {
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
  Future<Either<TaskModel, Failure>> createTask(
      {required TaskModel taskModel}) async {
    try {
      String imageUrl = await uploadImage(imageFile: taskModel.imageFile!);
      taskModel.image = imageUrl;
      TaskModel createdTask =
          await dataService.createTask(taskModel: taskModel);
      return left(createdTask);
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
        String imageUrl = await uploadImage(imageFile: taskModel.imageFile!);
        taskModel.image = imageUrl;
      }
      await dataService.editTask(taskModel: taskModel);
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
  Future<String> uploadImage({required File imageFile}) async {
    String imagePath = await dataService.uploadImage(imageFile: imageFile);
    String imageUrl = "$kBaseUrl/images/$imagePath";
    return imageUrl;
  }

  
  @override
  Future<Either<void, Failure>> deleteTask({required String taskId}) async {
    try {
      await dataService.deleteTask( taskId: taskId);
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
