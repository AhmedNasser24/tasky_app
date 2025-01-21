import 'package:dartz/dartz.dart';
import 'package:tasky_app/core/models/task_model.dart';

import '../../../../core/errors/failure.dart';

abstract class DataRepo {
  Future<Either < List <TaskModel >, Failure >> fetchData({required int pageNum}) ;
  Future<String> refreshToken() ;
}