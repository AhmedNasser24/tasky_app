import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../../domain/entities/task_entity.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton(this.taskEntity, this.formKey, {super.key});
  final TaskEntity taskEntity;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (taskEntity.imageFile == null) {
          showSnackBarFailure(context, "image is required");
        } else if (taskEntity.priority == null) {
          showSnackBarFailure(context, "priority is required");
        } else if (formKey.currentState!.validate()) {
          BlocProvider.of<TaskOperationCubit>(context)
              .createTask(taskEntity: taskEntity);
        }
      },
      title: "Add task",
    );
  }
}
