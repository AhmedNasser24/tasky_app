import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/services/api_services.dart';
import '../models/task_model.dart';
import '../secrets/end_point.dart';

class DataService {
  final ApiServices _apiServices;

  DataService(this._apiServices);
  Future<List<TaskModel>> fetchTasks(
      { required int pageNum}) async {
    var data = await _apiServices.get(
      endPoint: EndPoint.getTasks,
      queryParameters: {"page": pageNum},
    );
    List<TaskModel> tasksList = [];
    for (var task in data) {
      tasksList.add(TaskModel.fromJsonFetch(task));
    }
    return tasksList;
  }

  Future<void> createTask(
      {required String accessToken, required TaskModel taskModel}) async {
    await _apiServices.post(
        endPoint: EndPoint.createTask,
        data: taskModel.toJsonCreate(),
        authorization: accessToken);
  }

  Future<String> uploadImage(
      {required String accessToken, required File imageFile}) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
        contentType:
            DioMediaType.parse("image/${imageFile.path.split('.').last}"),
      ),
    });

    var data = await _apiServices.post(
        endPoint: EndPoint.uploadImage,
        data: formData,
        authorization: accessToken);
    return data[ApiKeys.taskImage];
  }

  Future<void> editTask(
      {required String accessToken, required TaskModel taskModel}) async {
    String taskId = taskModel.taskId!;
    await _apiServices.put(
        endPoint: "${EndPoint.editTask}$taskId",
        data: taskModel.toJsonEdit(),
        authorization: accessToken);
  }

  Future<TaskModel> fetchOneTask(
      { required String qrData}) async {
    var data = await _apiServices.get(
        endPoint: "${EndPoint.one}$qrData");
    TaskModel task = TaskModel.fromJsonFetch(data);
    return task;
  }

  Future<void> deleteTask(
      { required String taskId}) async {
    await _apiServices.delete(
        endPoint: "${EndPoint.deleteTask}$taskId");
  }
}
