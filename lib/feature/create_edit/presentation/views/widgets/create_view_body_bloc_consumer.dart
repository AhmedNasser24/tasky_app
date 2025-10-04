import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_model_progress_hud.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';

import 'create_view_body.dart';

class CreateViewBodyBlocConsumer extends StatelessWidget {
  const CreateViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<TaskOperationCubit, TaskOperationState>(
      listener: (context, state) {
        if (state is CreateTaskSuccess) {
          showSnackBar(context, "task is added successfully");
          Navigator.pop(context);
        } else if (state is CreateTaskLoading) {
          isLoading = true;
        } else if (state is CreateTaskFailure) {
          isLoading = false ;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          isLoading: isLoading,
          child: const CreateViewBody(),
        );
      },
    );
  }
}
