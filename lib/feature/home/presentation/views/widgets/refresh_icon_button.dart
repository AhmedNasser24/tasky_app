import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';

class RefreshIconButton extends StatelessWidget {
  const RefreshIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<TaskOperationCubit>(context).refresh();
      },
      icon: const Icon(Icons.refresh, color: AppColor.primaryColor, size: 30),
    );
  }
}
