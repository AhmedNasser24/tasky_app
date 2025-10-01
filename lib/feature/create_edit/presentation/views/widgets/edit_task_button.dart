import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';

import '../../../../../core/models/task_model.dart';
import '../../manager/edit_task_cubit/edit_task_cubit.dart';

class EditTaskButton extends StatelessWidget {
  const EditTaskButton(
      {required this.taskModel,
      required this.formKey,
      super.key,
      required this.editTaskModel});
  final TaskModel taskModel;
  final TaskModel editTaskModel;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        // log("old task : ${taskModel.desc}");
        // log("new task : ${editTaskModel.desc}");
        // log("old task : ${taskModel.status}");
        // log("new task : ${editTaskModel.status}");
        // log("old task : ${taskModel.title}");
        // log("new task : ${editTaskModel.title}");
        log("old task : ${taskModel.priority}");
        log("new task : ${editTaskModel.priority}");
        if (!isTaskEdited(taskModel, editTaskModel)) {
          showSnackBar(context, "task is not edited");
        } else if (taskModel.imageFile == null || taskModel.image == null) {
          showSnackBar(context, "image is required");
        } else if (formKey.currentState!.validate()) {
          log("validation passed");
          log("old task : ${taskModel.priority}");
          log("new task : ${editTaskModel.priority}");
          BlocProvider.of<EditTaskCubit>(context)
              .editTask(taskModel: editTaskModel);
        }
      },
      title: "Edit task",
    );
  }

  bool isTaskEdited(TaskModel taskModel, TaskModel editTaskModel) {
    return taskModel.image != editTaskModel.image ||
        taskModel.priority != editTaskModel.priority ||
        taskModel.status != editTaskModel.status ||
        taskModel.title != editTaskModel.title ||
        taskModel.desc != editTaskModel.desc;
  }
}
