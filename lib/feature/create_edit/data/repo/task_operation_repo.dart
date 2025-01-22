import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/task_model.dart';

abstract class TaskOperationRepo {
  Future < Either < void , Failure >> createTask({required TaskModel taskModel});
  Future<String> refreshToken() ;
  Future < void > uploadImage({required File image});
  Future < Either <void , Failure >> editTask({required TaskModel taskModel});
}