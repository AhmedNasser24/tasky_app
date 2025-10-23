import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_app/core/api/end_point.dart';
import '../models/task_model.dart';

import '../../../../core/errors/failure.dart';

import '../../domain/entities/task_entity.dart';
import '../data_source/data_source.dart';
import '../../domain/repo/task_operation_repo.dart';

class TaskOperationRepoImpl extends TaskOperationRepo {
  final DataSource dataSource;

  TaskOperationRepoImpl({required this.dataSource});

  @override
  Future<Either<List<TaskEntity>, Failure>> fetchAllTasks(
      {required int pageNum}) async {
    try {
      List<TaskModel> tasksModel =
          await dataSource.fetchTasks(pageNum: pageNum);
      List<TaskEntity> tasksEntity = tasksModel.map((taskModel) => taskModel as TaskEntity).toList();
      return left(tasksEntity);
    } on DioException catch (e) {
      log("fetch data error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {

      log("fetch data error with 403 : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }

  

  @override
  Future<Either<TaskEntity, Failure>> fetchOneTask(
      {required String qrData}) async {
    try {
      TaskEntity taskEntity = await dataSource.fetchOneTask(qrData: qrData);
      return left(taskEntity);
    } on DioException catch (e) {
      log("fetch one task error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("fetch one task error : ${e.toString()}");
      return right(const ServerFailure("Task not found , please try again"));
    }
  }

  @override
  Future<Either<TaskEntity, Failure>> createTask(
      {required TaskEntity taskEntity}) async {
    try {
      String imageUrl = await __uploadImage(imageFile: taskEntity.imageFile!);
      taskEntity.image = imageUrl;
      TaskModel taskModel = TaskModel.fromEntity(taskEntity);
      TaskEntity createdTask =
          await dataSource.createTask(taskModel: taskModel);
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
  Future<Either<void, Failure>> editTask({required TaskEntity taskEntity}) async {
    try {
      if (taskEntity.imageFile != null) {
        String imageUrl = await __uploadImage(imageFile: taskEntity.imageFile!);
        taskEntity.image = imageUrl;
      }

      TaskModel taskModel = TaskModel.fromEntity(taskEntity);
      await dataSource.editTask(taskModel: taskModel);
      return left(null);
    } on DioException catch (e) {
      log("edit task error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("edit task error : ${e.toString()}");
      return right(const ServerFailure("Error , please try again"));
    }
  }

  
  Future<String> __uploadImage({required File imageFile}) async {
    String imagePath = await dataSource.uploadImage(imageFile: imageFile);
    String imageUrl = "${EndPoint.baseUrl}/images/$imagePath";
    return imageUrl;
  }

  
  @override
  Future<Either<void, Failure>> deleteTask({required String taskId}) async {
    try {
      await dataSource.deleteTask( taskId: taskId);
      return left(null);
    } on DioException catch (e) {
      log("delete task error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("delete task error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }
}
