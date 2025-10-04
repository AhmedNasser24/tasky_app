import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/home/presentation/manager/fetch_task_cubit/fetch_task_cubit.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_no_internet_state_body.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_success_state_body.dart';
import 'task_empty_state_body.dart';
import 'task_loading_state_body.dart';

class TaskItemsBlocBuilder extends StatelessWidget {
  const TaskItemsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTaskCubit, FetchTaskState>(
      builder: (context, state) {
        // return TaskNoInternetStateBody() ;
        if (state is FetchTaskSuccess) {
          return TaskSuccessStateBody(state: state);
        } else if (state is FetchTaskLoading) {
          return const TaskLoadingStateBody();
        } else if (state is FetchTaskEmpty) {
          return const TaskEmptyStateBody();
        } else if (state is FetchTaskNoInternet) {
          return const TaskNoInternetStateBody();
        } else {
          return const TaskSuccessStateBody();
        }
      },
    );
  }
}
