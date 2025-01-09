import 'package:tasky_app/core/services/api_services.dart';
import '../../feature/home/data/models/task_model.dart';
import '../secrets/end_point.dart';

class DataService {
  final ApiServices _apiServices;

  DataService(this._apiServices);
  Future<List<TaskModel>> fetchTasks({required String accessToken}) async {
    var data = await _apiServices.get(
      endPoint: EndPoint.getTasks,
      authorization: accessToken,
    );
    List<TaskModel> tasksList = [];
    for (var task in data) {
      tasksList.add(TaskModel.fromJson(task));
    }
    return tasksList;
  }
}
