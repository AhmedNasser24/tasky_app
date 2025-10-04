import 'package:dartz/dartz.dart';
import 'package:tasky_app/core/models/task_model.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  
  Future<Either<TaskModel, Failure>> fetchOneTask({required String qrData});
}
