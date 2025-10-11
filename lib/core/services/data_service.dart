import 'dart:io';

import '../models/task_model.dart';

abstract class DataService {
  Future<List<TaskModel>> fetchTasks({required int pageNum});

  Future<TaskModel> createTask({required TaskModel taskModel});

  Future<String> uploadImage({required File imageFile});

  Future<void> editTask({required TaskModel taskModel});

  Future<TaskModel> fetchOneTask({required String qrData});

  Future<void> deleteTask({required String taskId});
}
