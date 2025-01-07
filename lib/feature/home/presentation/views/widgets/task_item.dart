import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import '../../../../../core/utils/app_images.dart';
import 'setting_icon_button.dart';
import 'task_item_date.dart';
import 'task_item_description.dart';
import 'task_item_image.dart';
import 'task_item_level.dart';
import 'task_item_statues.dart';
import 'task_item_title.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskItemImage(Assets.imagesTask),
          Gap(5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TaskItemTitle("Grocery Shopping App"),
                    ),
                    Gap(5),
                    TaskItemStatues(kFinished),
                  ],
                ),
                Gap(5),
                TaskItemDescription(
                    "This application is designed for super shops. By using "),
                Gap(5),
                Row(
                  children: [
                    TaskItemLevel(kMedium),
                    Spacer(),
                    TaskItemDate(),
                  ],
                )
              ],
            ),
          ),
          Gap(5),
          SettingIconButton(),
        ],
      ),
    );
  }
}








// make refactor to code