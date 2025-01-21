import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/task_model.dart';

abstract class CreateTaskRepo {
  Future < Either < void , Failure >> createTask({required TaskModel taskModel});
  Future<String> refreshToken() ;
}