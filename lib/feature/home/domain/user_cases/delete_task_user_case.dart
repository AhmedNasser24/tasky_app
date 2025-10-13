import 'package:dartz/dartz.dart';
import 'package:tasky_app/feature/home/domain/repo/task_operation_repo.dart';

import '../../../../core/errors/failure.dart';

class DeleteTaskUserCase {
  final TaskOperationRepo taskOperationRepo;
  DeleteTaskUserCase({required this.taskOperationRepo});

  Future<Either<void, Failure>> call({required String taskId}) {
    return taskOperationRepo.deleteTask(taskId: taskId);
  }
}