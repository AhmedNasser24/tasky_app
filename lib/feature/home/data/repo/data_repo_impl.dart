import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky_app/core/errors/failure.dart';
import 'package:tasky_app/core/services/data_service.dart';
import 'package:tasky_app/feature/home/data/models/task_model.dart';

import 'data_repo.dart';

class DataRepoImpl extends DataRepo {
  final DataService dataService ;

  DataRepoImpl(this.dataService);
  @override
  Future<Either < List <TaskModel >, Failure >> fetchData() async {
    try {
      List <TaskModel > taskModel = await dataService.fetchTasks();
      return left(taskModel) ;
    } on DioException catch (e) {
      log("fetch data error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } 
    
    catch (e) {
      log("fetch data error : ${e.toString()}");
      return right(const ServerFailure("please try again"));
    }
  }

}