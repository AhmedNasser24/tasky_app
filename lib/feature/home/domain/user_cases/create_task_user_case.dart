import 'package:dartz/dartz.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/feature/home/domain/entities/task_entity.dart';
import 'package:tasky_app/feature/home/domain/repo/task_operation_repo.dart';


class CreateTaskUserCase {
  final TaskOperationRepo taskOperationRepo;
  CreateTaskUserCase({required this.taskOperationRepo});

  Future<Either<TaskEntity, Failure>> call(
          {required TaskEntity taskEntity}) async =>
      await taskOperationRepo.createTask(taskEntity: taskEntity);
}
