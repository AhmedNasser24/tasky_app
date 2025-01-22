import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_model_progress_hud.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/create_task/presentation/manager/create_task_cubit/create_task_cubit.dart';
import 'package:tasky_app/feature/home/presentation/views/home_view.dart';

import 'create_view_body.dart';

class CreateViewBodyBlocConsumer extends StatelessWidget {
  const CreateViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<CreateTaskCubit, CreateTaskState>(
      listener: (context, state) {
        if (state is CreateTaskSuccess) {
          showSnackBar(context, "task is added successfully");
          Navigator.pushNamedAndRemoveUntil(context, HomeView.routeName, (_) => false);
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
