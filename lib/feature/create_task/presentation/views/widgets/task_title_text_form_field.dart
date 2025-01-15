import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/widgets/custom_textformfield.dart';

import '../../../../../core/utils/app_styles.dart';

class TaskTitleTextFormField extends StatelessWidget {
  const TaskTitleTextFormField({super.key});

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
            return null;
          },
        )
      ],
    );
  }
}