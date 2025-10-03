import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';

import '../../../../../core/models/task_model.dart';
import 'edit_app_bar.dart';
import 'edit_task_button.dart';
import 'image_form_field.dart';
import 'task_desc_text_form_field.dart';
import 'task_priority_form_field.dart';
import 'task_statues_form_field.dart';
import 'task_title_text_form_field.dart';

class EditBodyView extends StatefulWidget {
  const EditBodyView({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<EditBodyView> createState() => _EditBodyViewState();
}

class _EditBodyViewState extends State<EditBodyView> {
  late TaskModel editTaskModel;
  @override
  void initState() {
    // should copy all data to be used in cubit
    editTaskModel = TaskModel(
      image: widget.taskModel.image,
      priority: widget.taskModel.priority,
      status: widget.taskModel.status,
      taskId: widget.taskModel.taskId,
      title: widget.taskModel.title,
      desc: widget.taskModel.desc,
      userId: widget.taskModel.userId,
      imageFile: widget.taskModel.imageFile,
      createdAt: widget.taskModel.createdAt,
      updatedAt: widget.taskModel.updatedAt,
      currIndex: widget.taskModel.currIndex,
      dueDate: widget.taskModel.dueDate,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 550),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const EditAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(24),
                        ImageFormField(editTaskModel),
                        const Gap(16),
                        TaskTitleFormField(editTaskModel),
                        const Gap(16),
                        TaskDescTextFormField(editTaskModel),
                        const Gap(16),
                        TaskStatuesFormField(editTaskModel),
                        const Gap(16),
                        TaskPriorityFormField(editTaskModel),
                        const Gap(34),
                        EditTaskButton(
                            taskModel: widget.taskModel,
                            editTaskModel: editTaskModel,
                            formKey: formKey),
                        const Gap(kBottomSpace),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
