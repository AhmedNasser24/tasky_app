import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/widgets/custom_textformfield.dart';

import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_styles.dart';

class TaskTitleFormField extends StatelessWidget {
  const TaskTitleFormField(this.taskModel , {super.key});
  final TaskModel taskModel ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        Text ('Task Title', style: AppStyles.regular12.copyWith(color: const Color(0xff6E6A7C))),
        const Gap(8),
        CustomTextFormField(
          hintText: "Enter title here...",
          validator: (title){
            if(title == null || title.isEmpty){
              return "field is required";
            }
            taskModel.title = title;
            return null;
          },
        )
      ],
    );
  }
}