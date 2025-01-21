import 'package:tasky_app/core/services/api_services.dart';
import '../models/task_model.dart';
import '../secrets/end_point.dart';

class DataService {
  final ApiServices _apiServices;

  DataService(this._apiServices);
  Future<List<TaskModel>> fetchTasks(
      {required String accessToken, required int pageNum}) async {
    var data = await _apiServices.get(
        endPoint: EndPoint.getTasks,
        authorization: accessToken,
        queryParameters: {"page": pageNum});
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
}
