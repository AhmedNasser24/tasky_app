import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/theme/app_images.dart';
import '../../../feature/home/presentation/widgets/home_details_scan/task_item_date.dart';
import '../../../feature/home/presentation/widgets/home_details_scan/task_item_description.dart';
import '../../../feature/home/presentation/widgets/home_details_scan/task_item_image.dart';
import '../../../feature/home/presentation/widgets/home_details_scan/task_item_level.dart';
import '../../../feature/home/presentation/widgets/home_details_scan/task_item_statues.dart';
import '../../../feature/home/presentation/widgets/home_details_scan/task_item_title.dart';

class TaskItemSkeletonizer extends StatelessWidget {
  const TaskItemSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Skeletonizer(
        enabled: true,
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
                        child: TaskItemTitle("Grocery App"),
                      ),
                      Gap(5),
                      TaskItemStatues(kFinished),
                    ],
                  ),
                  Spacer(),
                  TaskItemDescription("This application is"),
                  Spacer(),
                  Row(
                    children: [
                      TaskItemPriority(kMedium, isDamy: true),
                      Spacer(),
                      TaskItemDate(),
                    ],
                  )
                ],
              ),
            ),
            Gap(5),
            // SettingIconButton(),
          ],
        ),
      ),
    );
  }
}








// make refactor to code