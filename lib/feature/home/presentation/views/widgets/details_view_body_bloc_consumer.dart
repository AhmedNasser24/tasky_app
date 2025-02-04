import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_model_progress_hud.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/details_view_body.dart';

import '../../../../../core/models/task_model.dart';
import '../home_view.dart';

class DetailsViewBodyBlocConsumer extends StatelessWidget {
  const DetailsViewBodyBlocConsumer({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else if (state is DeleteTaskFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is DeleteTaskLoading,
          child: CustomModalProgressHud(
            isLoading: state is DeleteTaskLoading,
            child: DetailsViewBody(taskModel: taskModel),
          ),
        );
      },
    );
  }
}
