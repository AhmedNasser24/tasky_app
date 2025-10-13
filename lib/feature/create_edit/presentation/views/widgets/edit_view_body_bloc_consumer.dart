import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_model_progress_hud.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import 'edit_body_view.dart';
import '../../../../home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';

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
          showSnackBarSuccess(context, "task is updated successfully");
          Navigator.pop(context);
        } else if (state is EditTaskFailure) {
          isLoading = false;
          showSnackBarFailure(context, state.errmessage);
        } else if (state is EditTaskLoading) {
          isLoading = true;
        }
        //  else if (state is NoInternetConnection) {   // not used isFirstTaskOperation bec it is always false in this case
        //   // showSnackBarFailure(context, state.message,
        //   //     duration: const Duration(hours: 5)); // to still displaying snackbar
        // } else if (state is InternetConnectionReturned) {
        //   showSnackBarSuccess(context, state.message);
        // }
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
