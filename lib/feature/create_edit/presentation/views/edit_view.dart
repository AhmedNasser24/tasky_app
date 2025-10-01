import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/core/utils/get_it_setup.dart';
import 'package:tasky_app/feature/create_edit/data/repo/task_operation_repo.dart';
import 'package:tasky_app/feature/create_edit/presentation/manager/edit_task_cubit/edit_task_cubit.dart';

import 'widgets/edit_view_body_bloc_consumer.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.taskModel});
  final TaskModel taskModel;
  static const routeName = '/edit';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTaskCubit(getIt.get<TaskOperationRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: EditViewBodyBlocConsumer(taskModel: taskModel),
        ),
      ),
    );
  }
}
