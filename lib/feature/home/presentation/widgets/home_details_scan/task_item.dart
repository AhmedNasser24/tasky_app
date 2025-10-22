import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/routes/routes.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../domain/entities/task_entity.dart';
import 'setting_icon_button.dart';
import 'task_item_date.dart';
import 'task_item_description.dart';
import 'task_item_image.dart';
import 'task_item_level.dart';
import 'task_item_statues.dart';
import 'task_item_title.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.taskModel});
  final TaskEntity taskModel;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: InkWell(
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                context.pushNamed(
                  AppRouter.details,
                  extra: taskModel,
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
                        const Spacer(),
                        TaskItemDescription(taskModel.desc!),
                        const Spacer(),
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
                  const Gap(20),
                ],
              ),
            ),
          ),
          Positioned(
            top: -8,
            right: 0,
            child: SettingIconButton(taskEntity: taskModel),
          ),
        ],
      ),
    );
  }
}
