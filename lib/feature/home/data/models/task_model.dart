import '../../domain/entities/task_entity.dart';

import '../../../../core/helper/api_keys.dart';

class TaskModel extends TaskEntity {
  TaskModel(
      {super.taskId,
      super.image,
      super.imageFile,
      super.title,
      super.desc,
      super.priority,
      super.status,
      super.userId,
      super.createdAt,
      super.updatedAt,
      super.dueDate,
      super.currIndex});

  factory TaskModel.fromEntity(TaskEntity taskModel) => TaskModel(
        taskId: taskModel.taskId,
        image: taskModel.image,
        imageFile: taskModel.imageFile,
        title: taskModel.title,
        desc: taskModel.desc,
        priority: taskModel.priority,
        status: taskModel.status,
        userId: taskModel.userId,
        createdAt: taskModel.createdAt,
        updatedAt: taskModel.updatedAt,
        dueDate: taskModel.dueDate,
        currIndex: taskModel.currIndex,
      );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
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

  Map<String, dynamic> toJsonCreate() => {
        ApiKeys.taskImage: image,
        ApiKeys.taskTitle: title,
        ApiKeys.taskDesc: desc,
        ApiKeys.taskPriority: priority,
        ApiKeys.taskDueDate: dueDate,
      };
  Map<String, dynamic> toJsonEdit() => {
        ApiKeys.taskImage: image,
        ApiKeys.taskTitle: title,
        ApiKeys.taskDesc: desc,
        ApiKeys.taskPriority: priority,
        ApiKeys.taskStatus: status,
        ApiKeys.userId: userId,
      };
}
