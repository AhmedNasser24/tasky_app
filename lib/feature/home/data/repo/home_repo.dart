import 'package:dartz/dartz.dart';
import 'package:tasky_app/core/models/task_model.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<List<TaskModel>, Failure>> fetchAllTasks(
      {required int pageNum});
  Future<Either<TaskModel, Failure>> fetchOneTask({required String qrData});
  Future<String> refreshToken();
  Future<Either<void, Failure>> deleteTask({required String taskId});
}
