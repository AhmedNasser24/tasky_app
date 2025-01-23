import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/helper/date_picker.dart';
import 'package:tasky_app/core/helper/format_date.dart';
import 'package:tasky_app/core/widgets/custom_textformfield.dart';

import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class TaskDueDateFormField extends StatefulWidget {
  const TaskDueDateFormField(this.taskModel , {super.key});
  final TaskModel taskModel ;

  @override
  State<TaskDueDateFormField> createState() => _TaskDueDateFormFieldState();
}

class _TaskDueDateFormFieldState extends State<TaskDueDateFormField> {
  late TextEditingController dateController;
  @override
  void initState() {
    dateController = TextEditingController(text: widget.taskModel.dueDate);
    super.initState();
  }
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
          validator: (dueDate) {
            if (dueDate == null || dueDate.isEmpty) {
              return "field is required";
            }
            widget.taskModel.dueDate = dueDate;
            return null;
          },
        ),
      ],
    );
  }
}
