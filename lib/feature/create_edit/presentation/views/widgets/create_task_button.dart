import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_button.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/home/presentation/manager/fetch_task_cubit/fetch_task_cubit.dart';

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
          showSnackBar(context, "image is required");
        } else if (taskModel.priority == null) {
          showSnackBar(context, "priority is required");
        } else if (formKey.currentState!.validate()) {
          BlocProvider.of<FetchTaskCubit>(context)
              .createTask(taskModel: taskModel);
        }
      },
      title: "Add task",
    );
  }
}
