import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';

import '../../../domain/entities/task_entity.dart';

class EditTaskButton extends StatelessWidget {
  const EditTaskButton(
      {required this.taskEntity,
      required this.formKey,
      super.key,
      required this.editTaskEntity});
  final TaskEntity taskEntity;
  final TaskEntity editTaskEntity;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
      
        if (!isTaskEdited(taskEntity, editTaskEntity)) {
          showSnackBarFailure(context, "task is not edited");
        } else if (editTaskEntity.imageFile == null && editTaskEntity.image == null) {    // this mean that user delete image and not upload new one from device
          showSnackBarFailure(context, "image is required");
        } else if (formKey.currentState!.validate()) {
          
          BlocProvider.of<TaskOperationCubit>(context)
              .editTask(taskEntity: editTaskEntity);
        }
      },
      title: "Edit task",
    );
  }

  bool isTaskEdited(TaskEntity taskEntity, TaskEntity edittaskEntity) {
    return taskEntity.image != edittaskEntity.image ||
        taskEntity.priority != edittaskEntity.priority ||
        taskEntity.status != edittaskEntity.status ||
        taskEntity.title != edittaskEntity.title ||
        taskEntity.desc != edittaskEntity.desc;
  }
}
