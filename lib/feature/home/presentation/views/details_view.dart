import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/utils/get_it_setup.dart';
import 'package:tasky_app/feature/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';

import '../../../../core/models/task_model.dart';
import '../../data/repo/home_repo.dart';
import 'widgets/details_view_body_bloc_consumer.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteTaskCubit(getIt.get<HomeRepo>()),
      child: Scaffold(
        body: SafeArea(
          child: DetailsViewBodyBlocConsumer(
            taskModel: taskModel,
          ),
        ),
      ),
    );
  }
}
