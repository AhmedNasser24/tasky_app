import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_model_progress_hud.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';
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
          showSnackBarSuccess(context, "task is added successfully");
          context.pop();
        } else if (state is CreateTaskLoading) {
          isLoading = true;
        } else if (state is CreateTaskFailure) {
          isLoading = false;
          showSnackBarFailure(context, state.errMessage);
        }
        // else if (state is NoInternetConnection) {   // not used isFirstTaskOperation bec can navigate to create view without internet at first
        //   // showSnackBarFailure(context, state.message,
        //   //     duration: const Duration(hours: 5)); // to still displaying snackbar
        // } else if (state is InternetConnectionReturned) {
        //   showSnackBarSuccess(context, state.message);
        // }
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
