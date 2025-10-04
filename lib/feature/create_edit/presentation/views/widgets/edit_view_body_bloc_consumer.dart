import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_model_progress_hud.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/create_edit/presentation/views/widgets/edit_body_view.dart';
import 'package:tasky_app/feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';

import '../../../../../core/models/task_model.dart';

class EditViewBodyBlocConsumer extends StatelessWidget {
  const EditViewBodyBlocConsumer({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<TaskOperationCubit, TaskOperationState>(
      listener: (context, state) {
        if (state is EditTaskSuccess) {
          showSnackBar(context, "task is updated successfully");
          Navigator.pop(context);
          
        } else if (state is EditTaskFailure) {
          isLoading = false;
          showSnackBar(context, state.errmessage);
        } else if (state is EditTaskLoading) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          isLoading: isLoading,
          child: EditBodyView(taskModel: taskModel),
        );
      },
    );
  }
}
