import 'package:dartz/dartz.dart';
import '../repo/task_operation_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';

class FetchAllTaskUserCase {
  FetchAllTaskUserCase({required this.taskOperationRepo});
  final TaskOperationRepo taskOperationRepo;

  Future<Either<List<TaskEntity>, Failure>> call({required int pageNum}) {
    return taskOperationRepo.fetchAllTasks(pageNum: pageNum);
  }
}