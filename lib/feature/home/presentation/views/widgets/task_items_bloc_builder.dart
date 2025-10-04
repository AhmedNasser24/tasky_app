import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_no_internet_state_body.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_success_state_body.dart';
import 'task_loading_state_body.dart';

class TaskItemsBlocBuilder extends StatelessWidget {
  const TaskItemsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskOperationCubit, TaskOperationState>(
      listener: (context, state) {
        bool isFirstTaskOperation =
            BlocProvider.of<TaskOperationCubit>(context).isFirstTaskOperation;
        if (state is FetchTaskNoInternet && !isFirstTaskOperation) {
          showSnackBar(context, state.message);
        }
        else if (state is FetchTaskFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        bool isFirstTaskOperation =
            BlocProvider.of<TaskOperationCubit>(context).isFirstTaskOperation;
        if (state is FetchTaskSuccess) {
          return TaskSuccessStateBody(state: state);
        } else if (state is FetchTaskLoading) {
          return const TaskLoadingStateBody();
        } else if (state is FetchTaskNoInternet && isFirstTaskOperation) {
          if (isFirstTaskOperation) {
            return const TaskNoInternetStateBody();
          } else {
            return const TaskSuccessStateBody();
          }
        } else {
          return const TaskSuccessStateBody();
        }
      },
    );
  }
}
