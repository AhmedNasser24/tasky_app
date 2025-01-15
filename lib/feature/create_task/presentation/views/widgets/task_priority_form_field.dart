import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/utils/app_images.dart';
import 'package:tasky_app/core/widgets/custom_textformfield.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';

class TaskPriorityTextFormField extends StatefulWidget {
  const TaskPriorityTextFormField({super.key});

  @override
  State<TaskPriorityTextFormField> createState() =>
      _TaskPriorityTextFormFieldState();
}

class _TaskPriorityTextFormFieldState extends State<TaskPriorityTextFormField> {
  late String currPriority;
  late TextEditingController controller;
  @override
  void initState() {
    currPriority = "Medium Priority";
    controller = TextEditingController(text: currPriority);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority',
            style:
                AppStyles.regular12.copyWith(color: const Color(0xff6E6A7C))),
        const Gap(8),
        CustomTextFormField(
          controller: controller,
          readOnly: true,
          textStyle: AppStyles.bold16.copyWith(color: AppColor.primaryColor),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start:  9.0, end: 9.0),
            child: SvgPicture.asset(Assets.imagesMediumFlag),
          ),
          suffixIcon: const Icon(
            Icons.arrow_drop_down_rounded,
            color: AppColor.primaryColor,
            size: 50,
          ),
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          borderSide: 0,
          onTap: () {},
          validator: (title) {
            if (title == null || title.isEmpty) {
              return "field is required";
            }
            return null;
          },
        )
      ],
    );
  }
}
