import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/utils/get_it_setup.dart';
import 'package:tasky_app/feature/create_task/presentation/manager/create_task_cubit/create_task_cubit.dart';

import '../../data/repo/create_task_repo.dart';
import 'widgets/create_view_body_bloc_consumer.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});
  static const routeName = '/createView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTaskCubit(getIt.get<CreateTaskRepo>()),
      child: const Scaffold(
        body: SafeArea(
          child: CreateViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}

