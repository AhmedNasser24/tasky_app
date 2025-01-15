import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/widgets/custom_textformfield.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class TaskDueDateTextFormField extends StatelessWidget {
  const TaskDueDateTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Due date',
            style:
                AppStyles.regular12.copyWith(color: const Color(0xff6E6A7C))),
        const Gap(8),
        CustomTextFormField(
          hintText: "choose due date...",
          suffixIcon: GestureDetector(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: SvgPicture.asset(Assets.imagesCalendar ),
            ),
          ),
          validator: (title) {
            if (title == null || title.isEmpty) {
              return "field is required";
            }
            return null;
          },
        ),

      ],
    );
  }
}
