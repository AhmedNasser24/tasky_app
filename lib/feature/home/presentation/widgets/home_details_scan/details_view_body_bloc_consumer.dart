import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_model_progress_hud.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';
import 'details_view_body.dart';

import '../../../domain/entities/task_entity.dart';

class DetailsViewBodyBlocConsumer extends StatelessWidget {
  const DetailsViewBodyBlocConsumer({super.key, required this.taskEntity});
  final TaskEntity taskEntity;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskOperationCubit, TaskOperationState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          showSnackBarFailure(context, "task is deleted successfully");
          Navigator.pop(context);
        } else if (state is DeleteTaskFailure) {
          showSnackBarFailure(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is DeleteTaskLoading,
          child: CustomModalProgressHud(
            isLoading: state is DeleteTaskLoading,
            child: DetailsViewBody(taskEntity: taskEntity),
          ),
        );
      },
    );
  }
}
