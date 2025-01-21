import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:tasky_app/core/errors/failure.dart';

import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/core/services/auth_services.dart';
import 'package:tasky_app/core/services/data_service.dart';

import '../../../../core/helper/api_keys.dart';
import '../../../../core/utils/shared_preference_singleton.dart';
import 'create_task_repo.dart';

class CreateTaskRepoImpl extends CreateTaskRepo {
  final DataService dataService;
  final AuthServices authServices ;

  CreateTaskRepoImpl({required this.dataService , required this.authServices}); 
  @override
  Future<Either<void, Failure>> createTask({required TaskModel taskModel}) async {
    try {
      String newAccessToken = await refreshToken();
      await dataService.createTask(accessToken: newAccessToken, taskModel: taskModel);
      return left(null) ;
    } on DioException catch (e) {
      log("create task error : ${e.toString()}");
      return right(ServerFailure.fromDioException(e));
    } 
    
    catch (e) {
      log("create task error : ${e.toString()}");
      return right(const ServerFailure("Error , please try again"));
    }
  }

  
  @override
  Future<String> refreshToken() async {
    String refreshToken =
        SharedPreferenceSingleton.getString(ApiKeys.refreshToken);
    String newAccessToken =
        await authServices.refreshToken(refreshToken: refreshToken);
    await SharedPreferenceSingleton.setString(
        ApiKeys.accessToken, newAccessToken);
    return newAccessToken;
  }
}