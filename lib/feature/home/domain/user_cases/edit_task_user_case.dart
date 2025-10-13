import 'package:dartz/dartz.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/feature/home/domain/entities/task_entity.dart';

import '../repo/task_operation_repo.dart';

class EditTaskUserCase {
  final TaskOperationRepo taskOperationRepo;
  EditTaskUserCase({required this.taskOperationRepo});

  Future<Either<void, Failure>> call(
          {required TaskEntity taskEntity}) async =>
      await taskOperationRepo.editTask(taskEntity: taskEntity);
}
