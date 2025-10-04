import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';

import '../../../../../core/models/task_model.dart';

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
      
        if (!isTaskEdited(taskModel, editTaskModel)) {
          showSnackBarFailure(context, "task is not edited");
        } else if (editTaskModel.imageFile == null && editTaskModel.image == null) {    // this mean that user delete image and not upload new one from device
          showSnackBarFailure(context, "image is required");
        } else if (formKey.currentState!.validate()) {
          log("validation passed");
          
          BlocProvider.of<TaskOperationCubit>(context)
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
