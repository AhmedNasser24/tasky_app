import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/task_model.dart';

abstract class TaskOperationRepo {
  Future < Either < TaskModel , Failure >> createTask({required TaskModel taskModel});
  Future < void > uploadImage({required File imageFile});
  Future < Either <void , Failure >> editTask({required TaskModel taskModel});
  Future<Either<List<TaskModel>, Failure>> fetchAllTasks(
      {required int pageNum});
  Future<Either<void, Failure>> deleteTask({required String taskId});
}