import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/create_edit/presentation/manager/create_task_cubit/create_task_cubit.dart';

import '../../../../../core/models/task_model.dart';
import '../../manager/edit_task_cubit/edit_task_cubit.dart';

class EditTaskButton extends StatelessWidget {
  const EditTaskButton(this.taskModel, this.formKey, {super.key});
  final TaskModel taskModel;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (taskModel.imageFile == null) {
          showSnackBar(context, "image is required");
        } else if (taskModel.priority == null) {
          showSnackBar(context, "priority is required");
        } else if (formKey.currentState!.validate()) {
          BlocProvider.of<EditTaskCubit>(context)
              .editTask(taskModel: taskModel);
        }
      },
      title: "Edit task",
    );
  }
}
