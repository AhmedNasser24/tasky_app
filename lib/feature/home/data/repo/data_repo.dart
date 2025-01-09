import 'package:dartz/dartz.dart';
import 'package:tasky_app/feature/home/data/models/task_model.dart';

import '../../../../core/errors/failure.dart';

abstract class DataRepo {
  Future<Either < List <TaskModel >, Failure >> fetchData() ;
  Future<String> refreshToken() ;
}