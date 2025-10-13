import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../constants.dart';
import '../../../../../core/helper/media_query_extension.dart';
import '../../../domain/entities/task_entity.dart';
import 'create_app_bar.dart';
import 'create_task_button.dart';
import 'image_form_field.dart';
import 'task_priority_form_field.dart';
import 'task_desc_text_form_field.dart';
import 'task_due_date_text_form_field.dart';
import 'task_title_text_form_field.dart';

class CreateViewBody extends StatefulWidget {
  const CreateViewBody({super.key});

  @override
  State<CreateViewBody> createState() => _CreateViewBodyState();
}

class _CreateViewBodyState extends State<CreateViewBody> {
  TaskEntity taskModel = TaskEntity();
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
            const CreateAppBar(),
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
                            child: ImageFormField(taskModel),
                          ),
                        ),
                  Flexible(
                    flex: 5,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 550),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Gap(24),
                            screenWidth < 800 ? ImageFormField(taskModel) : const SizedBox(),
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
