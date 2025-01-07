import 'package:tasky_app/core/helper/api_keys.dart';

class TaskModel {
  String? id, image, title, desc, priority, status, user, createdAt, updatedAt;

  TaskModel(
      {this.id,
      this.image,
      this.title,
      this.desc,
      this.priority,
      this.status,
      this.user,
      this.createdAt,
      this.updatedAt});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json[ApiKeys.taskId],
        image: json[ApiKeys.taskImage],
        title: json[ApiKeys.taskTitle],
        desc: json[ApiKeys.taskDesc],
        priority: json[ApiKeys.taskPriority],
        status: json[ApiKeys.taskStatus],
        user: json[ApiKeys.taskUser],
        createdAt: json[ApiKeys.taskCreatedAt],
        updatedAt: json[ApiKeys.taskUpdatedAt],
      );

}
