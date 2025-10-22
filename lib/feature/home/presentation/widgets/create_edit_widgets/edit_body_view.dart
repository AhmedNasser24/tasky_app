import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/extensions/media_query_extension.dart';
import '../../../domain/entities/task_entity.dart';
import 'edit_app_bar.dart';
import 'edit_task_button.dart';
import 'image_form_field.dart';
import 'task_desc_text_form_field.dart';
import 'task_priority_form_field.dart';
import 'task_statues_form_field.dart';
import 'task_title_text_form_field.dart';

class EditBodyView extends StatefulWidget {
  const EditBodyView({super.key, required this.taskEntity});
  final TaskEntity taskEntity;
  @override
  State<EditBodyView> createState() => _EditBodyViewState();
}

class _EditBodyViewState extends State<EditBodyView> {
  late TaskEntity editTaskEntity;
  @override
  void initState() {
    // should copy all data to be used in cubit
    editTaskEntity = TaskEntity(
      image: widget.taskEntity.image,
      priority: widget.taskEntity.priority,
      status: widget.taskEntity.status,
      taskId: widget.taskEntity.taskId,
      title: widget.taskEntity.title,
      desc: widget.taskEntity.desc,
      userId: widget.taskEntity.userId,
      imageFile: widget.taskEntity.imageFile,
      createdAt: widget.taskEntity.createdAt,
      updatedAt: widget.taskEntity.updatedAt,
      currIndex: widget.taskEntity.currIndex,
      dueDate: widget.taskEntity.dueDate,
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
                          child: ImageFormField(editTaskEntity),
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
                            screenWidth < 800 ? ImageFormField(editTaskEntity) : const SizedBox(),
                            const Gap(16),
                            TaskTitleFormField(editTaskEntity),
                            const Gap(16),
                            TaskDescTextFormField(editTaskEntity),
                            const Gap(16),
                            TaskStatuesFormField(editTaskEntity),
                            const Gap(16),
                            TaskPriorityFormField(editTaskEntity),
                            const Gap(34),
                            EditTaskButton(
                                taskEntity: widget.taskEntity,
                                editTaskEntity: editTaskEntity,
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
