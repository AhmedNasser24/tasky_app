import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/feature/create_edit/presentation/views/widgets/create_app_bar.dart';
import 'package:tasky_app/feature/create_edit/presentation/views/widgets/create_task_button.dart';
import 'package:tasky_app/feature/create_edit/presentation/views/widgets/image_form_field.dart';
import 'package:tasky_app/feature/create_edit/presentation/views/widgets/task_priority_form_field.dart';

import 'task_desc_text_form_field.dart';
import 'task_due_date_text_form_field.dart';
import 'task_title_text_form_field.dart';

class CreateViewBody extends StatefulWidget {
  const CreateViewBody({super.key});

  @override
  State<CreateViewBody> createState() => _CreateViewBodyState();
}

class _CreateViewBodyState extends State<CreateViewBody> {
  @override
  Widget build(BuildContext context) {
    TaskModel taskModel = TaskModel();
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
                const CreateAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Gap(24),
                        ImageFormField(taskModel),
                        const Gap(16),
                        TaskTitleFormField(taskModel),
                        const Gap(16),
                        TaskDescTextFormField(taskModel),
                        const Gap(16),
                        TaskPriorityFormField(taskModel),
                        const Gap(16),
                        TaskDueDateFormField(taskModel),
                        const Gap(34),
                        CreateTaskButton(taskModel, formKey),
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
