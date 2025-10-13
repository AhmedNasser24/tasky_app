import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/show_snack_bar.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';
import 'task_loading_state_body.dart';
import 'task_success_state_body.dart';

class TaskItemsBlocBuilder extends StatelessWidget {
  const TaskItemsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskOperationCubit, TaskOperationState>(
      listener: (context, state) {
        if (state is NoInternetConnection) {
          showSnackBarFailure(context, state.message);
        } else if (state is InternetConnectionReturned) {
          showSnackBarSuccess(context, state.message);
        } else if (state is FetchTaskFailure) {
          showSnackBarFailure(context, state.errMessage);
        }
      },
      builder: (context, state) {
        bool isFirstTaskOperation =
            BlocProvider.of<TaskOperationCubit>(context).isFirstTaskOperation;

        if (state is FetchTaskSuccess) {
          return TaskSuccessStateBody(state: state);
        } else if (state is FetchTaskLoading || state is InitialState) {
          return const CustomLoadingSkeletonizer();
        } else if (state is NoInternetConnection) {
          if (isFirstTaskOperation) {
            return const CustomLoadingSkeletonizer();
          } else {
            return const TaskSuccessStateBody();
          }
        } else if (state is FetchTaskFailure && isFirstTaskOperation) {
          return const CustomLoadingSkeletonizer();
        } else {
          return const TaskSuccessStateBody();
        }
      },
    );
  }
}

class TaskItemList extends StatelessWidget {
  const TaskItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: const TaskItemsBlocBuilder(),
      onRefresh: () async =>
          await BlocProvider.of<TaskOperationCubit>(context).refresh(),
    );
  }
}
