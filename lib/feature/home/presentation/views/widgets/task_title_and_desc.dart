import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_styles.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_color.dart';

class TaskTitleAndDesc extends StatelessWidget {
  const TaskTitleAndDesc(this.taskModel, {super.key});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    String title = taskModel.title ?? '';
    String desc = taskModel.desc ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: 8),
      child: Column(
        children: [
          Text(title, style: AppStyles.bold24),
          const Gap(8),
          Text(desc,
              style: AppStyles.regular14.copyWith(color: AppColor.greyColor)),
        ],
      ),
    );
  }
}
