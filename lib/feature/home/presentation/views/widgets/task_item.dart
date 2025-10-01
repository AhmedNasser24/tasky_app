import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import '../../../../../core/models/task_model.dart';
import '../details_view.dart';
import 'setting_icon_button.dart';
import 'task_item_date.dart';
import 'task_item_description.dart';
import 'task_item_image.dart';
import 'task_item_level.dart';
import 'task_item_statues.dart';
import 'task_item_title.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding, vertical: 12.0),
          child: InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailsView.routeName,
                arguments: taskModel,
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TaskItemImage(taskModel.image!),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TaskItemTitle(taskModel.title!),
                          ),
                          const Gap(5),
                          TaskItemStatues(taskModel.status!),
                        ],
                      ),
                      const Gap(5),
                      TaskItemDescription(taskModel.desc!),
                      const Gap(5),
                      Row(
                        children: [
                          TaskItemPriority(taskModel.priority!),
                          const Spacer(),
                          TaskItemDate(date: taskModel.createdAt!),
                        ],
                      )
                    ],
                  ),
                ),
                const Gap(24),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SettingIconButton(taskModel: taskModel),
        ),
      ],
    );
  }
}
