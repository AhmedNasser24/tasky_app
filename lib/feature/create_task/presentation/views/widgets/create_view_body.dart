import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/feature/create_task/presentation/views/widgets/create_app_bar.dart';
import 'package:tasky_app/feature/create_task/presentation/views/widgets/create_task_button.dart';
import 'package:tasky_app/feature/create_task/presentation/views/widgets/image_form_field.dart';
import 'package:tasky_app/feature/create_task/presentation/views/widgets/task_priority_form_field.dart';

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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          CreateAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(24),
                  ImageFormField(),
                  Gap(16),
                  TaskTitleFormField(),
                  Gap(16),
                  TaskDescTextFormField(),
                  Gap(16),
                  TaskPriorityFormField(),
                  Gap(16),
                  TaskDueDateFormField(),
                  Gap(34),
                  CreateTaskButton(),
                  Gap(kBottomSpace),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
