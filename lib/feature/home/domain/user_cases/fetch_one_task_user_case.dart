import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/task_entity.dart';
import '../repo/task_operation_repo.dart';

class FetchOneTaskUserCase {
  final TaskOperationRepo taskOperationRepo;
  FetchOneTaskUserCase({required this.taskOperationRepo});

  Future<Either<TaskEntity, Failure>> call({required String qrData}) async {
    return await taskOperationRepo.fetchOneTask(qrData: qrData);
  }
}