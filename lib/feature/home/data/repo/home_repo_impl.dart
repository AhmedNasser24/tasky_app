import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/core/services/data_service.dart';
import 'package:tasky_app/core/models/task_model.dart';

import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final DataService dataService;
  HomeRepoImpl({ required this.dataService});
 

  

  @override
  Future<Either<TaskModel, Failure>> fetchOneTask(
      {required String qrData}) async {
    try {
      TaskModel taskModel = await dataService.fetchOneTask(qrData: qrData);
      return left(taskModel);
    } on DioException catch (e) {
      log("fetch one task error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } catch (e) {
      log("fetch one task error : ${e.toString()}");
      return right(const ServerFailure("Task not found , please try again"));
    }
  }

}
