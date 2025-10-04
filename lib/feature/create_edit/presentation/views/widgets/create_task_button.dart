import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';

import '../../../../../core/models/task_model.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton(this.taskModel, this.formKey, {super.key});
  final TaskModel taskModel;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (taskModel.imageFile == null) {
          showSnackBarFailure(context, "image is required");
        } else if (taskModel.priority == null) {
          showSnackBarFailure(context, "priority is required");
        } else if (formKey.currentState!.validate()) {
          BlocProvider.of<TaskOperationCubit>(context)
              .createTask(taskModel: taskModel);
        }
      },
      title: "Add task",
    );
  }
}
