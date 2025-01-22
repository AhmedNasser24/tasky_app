import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/widgets/custom_textformfield.dart';

import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_styles.dart';

class TaskDescTextFormField extends StatelessWidget {
  const TaskDescTextFormField(this.taskModel , {super.key});
  final TaskModel taskModel ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        Text('Task Description',
            style:
                AppStyles.regular12.copyWith(color: const Color(0xff6E6A7C))),
        const Gap(8),
        CustomTextFormField(
          hintText: "Enter description here...",
          maxLines: 5,
          validator: (desc) {
            if (desc == null || desc.isEmpty) {
              return "field is required";
            }
            taskModel.desc = desc;
            return null;
          },
        )
      ],
    );
  }
}
