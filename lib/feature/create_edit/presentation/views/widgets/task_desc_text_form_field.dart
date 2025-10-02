import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/widgets/custom_textformfield.dart';

import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_styles.dart';

class TaskDescTextFormField extends StatefulWidget {
  const TaskDescTextFormField(this.taskModel , {super.key});
  final TaskModel taskModel ;

  @override
  State<TaskDescTextFormField> createState() => _TaskDescTextFormFieldState();
}

class _TaskDescTextFormFieldState extends State<TaskDescTextFormField> {
  late TextEditingController controller ;
  @override
  void initState() {
    controller = TextEditingController(text: widget.taskModel.desc);
    super.initState();
  }
   @override
  dispose(){
    controller.dispose();
    super.dispose();
  }
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
          controller: controller,
          hintText: "Enter description here...",
          maxLines: 5,
          onChanged: (desc) => widget.taskModel.desc = desc,
          validator: (desc) {
            if (desc == null || desc.isEmpty) {
              return "field is required";
            }
            widget.taskModel.desc = desc;
            return null;
          },
        )
      ],
    );
  }
}
