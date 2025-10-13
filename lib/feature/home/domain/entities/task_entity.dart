import 'dart:io';
class TaskEntity {
  int? currIndex;
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
  TaskEntity(
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
      this.currIndex});
}
