import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';

abstract class TaskOperationRepo {
  Future < Either < TaskEntity , Failure >> createTask({required TaskEntity taskEntity});
  Future < Either <void , Failure >> editTask({required TaskEntity taskEntity});
  Future<Either<List<TaskEntity>, Failure>> fetchAllTasks(
      {required int pageNum});
  Future<Either<TaskEntity, Failure>> fetchOneTask({required String qrData});

  Future<Either<void, Failure>> deleteTask({required String taskId});
}