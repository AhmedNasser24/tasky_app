import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';

import '../../../../../core/models/task_model.dart';
import 'edit_app_bar.dart';
import 'edit_task_button.dart';
import 'image_form_field.dart';
import 'task_desc_text_form_field.dart';
import 'task_due_date_text_form_field.dart';
import 'task_priority_form_field.dart';
import 'task_title_text_form_field.dart';

class EditBodyView extends StatefulWidget {
  const EditBodyView({super.key, required this.taskModel});
  final TaskModel taskModel ; 
  @override
  State<EditBodyView> createState() => _EditBodyViewState();
}

class _EditBodyViewState extends State<EditBodyView> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const EditAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(24),
                    ImageFormField(widget.taskModel),
                    const Gap(16),
                    TaskTitleFormField(widget.taskModel),
                    const Gap(16),
                    TaskDescTextFormField(widget.taskModel),
                    const Gap(16),
                    TaskPriorityFormField(widget.taskModel),
                    const Gap(16),
                    TaskDueDateFormField(widget.taskModel),
                    const Gap(34),
                    EditTaskButton(widget.taskModel , formKey),
                    const Gap(kBottomSpace),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
