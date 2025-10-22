import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';

import '../../../../core/dependency_injection/get_it_setup.dart' as di;
import '../manager/login_cubit/login_cubit.dart';
import '../widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, this.initOperationTaskCubit = false});
  final bool initOperationTaskCubit;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    if (widget.initOperationTaskCubit) {
      BlocProvider.of<TaskOperationCubit>(context).initAllDataOfCubit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<LoginCubit>(),
      child: const Scaffold(
        body: SafeArea(
          child: LoginViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
