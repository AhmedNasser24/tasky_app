import 'dart:io';

import 'package:dio/dio.dart';
import '../models/task_model.dart';
import '../../../../core/helper/api_keys.dart';
import '../../../../core/api/api_consumer.dart';
import 'data_source.dart';
import '../../../../core/api/end_point.dart';

class DataSourceImpl extends DataSource {
  final ApiConsumer apiServices;
  
  DataSourceImpl({required this.apiServices});
  @override
  Future<List<TaskModel>> fetchTasks({required int pageNum}) async {
    var data = await apiServices.get(
      endPoint: EndPoint.getTasks,
      queryParameters: {"page": pageNum},
    );
    List<TaskModel> tasksList = [];
    for (var task in data) {
      tasksList.add(TaskModel.fromJson(task));
    }
    return tasksList;
  }

  @override
  Future<TaskModel> createTask({required TaskModel taskModel}) async {
    var data = await apiServices.post(
      endPoint: EndPoint.createTask,
      data: taskModel.toJsonCreate(),
    );
    TaskModel createdTask = TaskModel.fromJson(data);
    return createdTask;
  }

  @override
  Future<String> uploadImage({required File imageFile}) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
        contentType:
            DioMediaType.parse("image/${imageFile.path.split('.').last}"),
      ),
    });

    var data = await apiServices.post(
      endPoint: EndPoint.uploadImage,
      data: formData,
    );
    return data[ApiKeys.taskImage];
  }

  @override
  Future<void> editTask({required TaskModel taskModel}) async {
    String taskId = taskModel.taskId!;
    await apiServices.put(
      endPoint: "${EndPoint.editTask}$taskId",
      data: taskModel.toJsonEdit(),
    );
  }

  @override
  Future<TaskModel> fetchOneTask({required String qrData}) async {
    var data = await apiServices.get(endPoint: "${EndPoint.one}$qrData");
    TaskModel task = TaskModel.fromJson(data);
    return task;
  }

  @override
  Future<void> deleteTask({required String taskId}) async {
    await apiServices.delete(endPoint: "${EndPoint.deleteTask}$taskId");
  }
}
