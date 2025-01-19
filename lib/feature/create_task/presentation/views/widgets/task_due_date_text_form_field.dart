import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/helper/date_picker.dart';
import 'package:tasky_app/core/helper/format_date.dart';
import 'package:tasky_app/core/widgets/custom_textformfield.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class TaskDueDateFormField extends StatefulWidget {
  const TaskDueDateFormField({super.key});

  @override
  State<TaskDueDateFormField> createState() => _TaskDueDateFormFieldState();
}

class _TaskDueDateFormFieldState extends State<TaskDueDateFormField> {
  TextEditingController dateController = TextEditingController();

  Future<void> __selectDate() async {
    DateTime? pickedDate = await pickDate(context);
    if (pickedDate != null) {
      log(pickedDate.toString());
      setState(() {
        dateController.text = formatDate(pickedDate.toString());
      });
    }
  }

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
          controller: dateController,
          hintText: "choose due date...",
          onTap: () async {
            await __selectDate();
          },
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: SvgPicture.asset(Assets.imagesCalendar),
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
