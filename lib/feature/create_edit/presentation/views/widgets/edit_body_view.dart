import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../constants.dart';
import '../../../../../core/helper/media_query_extension.dart';

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const EditAppBar(),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  screenWidth < 800
                      ? const SizedBox()
                      : Flexible(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: ImageFormField(editTaskModel),
                        ),
                      ),
                  Flexible(
                    flex: 5,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 550),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Gap(24),
                            screenWidth < 800 ? ImageFormField(editTaskModel) : const SizedBox(),
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
                             const Gap(kBottomSpace ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
