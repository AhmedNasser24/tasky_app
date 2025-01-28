import 'dart:io';

import 'package:tasky_app/core/helper/api_keys.dart';

class TaskModel {
  String? taskId,
      image,
      title,
      desc,
      priority,
      status,
      userId,
      createdAt,
      updatedAt,
      dueDate;
  File? imageFile;
  TaskModel(
      {this.taskId,
      this.image,
      this.imageFile,
      this.title,
      this.desc,
      this.priority,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.dueDate,
      });

  factory TaskModel.fromJsonFetch(Map<String, dynamic> json) => TaskModel(
        taskId: json[ApiKeys.taskId],
        image: json[ApiKeys.taskImage],
        title: json[ApiKeys.taskTitle],
        desc: json[ApiKeys.taskDesc],
        priority: json[ApiKeys.taskPriority],
        status: json[ApiKeys.taskStatus],
        userId: json[ApiKeys.userId],
        createdAt: json[ApiKeys.taskCreatedAt],
        updatedAt: json[ApiKeys.taskUpdatedAt],
      );

  toJsonCreate() => {
        ApiKeys.taskImage: image,
        ApiKeys.taskTitle: title,
        ApiKeys.taskDesc: desc,
        ApiKeys.taskPriority: priority,
        ApiKeys.taskDueDate: dueDate,
      };
  toJsonEdit() => {
        ApiKeys.taskImage: image,
        ApiKeys.taskTitle: title,
        ApiKeys.taskDesc: desc,
        ApiKeys.taskPriority: priority,
        ApiKeys.taskStatus: status,
        ApiKeys.userId : userId ,
      };    
}
