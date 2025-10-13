import 'package:dartz/dartz.dart';
import '../../../../core/models/task_model.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  
  Future<Either<TaskModel, Failure>> fetchOneTask({required String qrData});
}
