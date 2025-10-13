import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../constants.dart';
import '../../../../../core/helper/media_query_extension.dart';
import 'generate_qr_code.dart';
import 'task_title_and_desc.dart';
import '../../../domain/entities/task_entity.dart';
import '../create_edit_widgets/details_priority.dart';
import 'details_app_bar.dart';
import 'details_statues.dart';
import 'details_task_image.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.taskEntity});
  final TaskEntity taskEntity;
  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DetailsAppBar(taskEntity: taskEntity),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              screenWidth < 800
                  ? const SizedBox()
                  : DetailsTaskImage(imgUrl: taskEntity.image!),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      screenWidth < 800
                          ? DetailsTaskImage(imgUrl: taskEntity.image!)
                          : const SizedBox(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TaskTitleAndDesc(taskEntity),
                      ),
                      const Gap(8),
                      DetailsStatues(taskEntity.status!),
                      DetailsPriority(taskEntity.priority!),
                      const Gap(16),
                      GenerateQrCode(taskId: taskEntity.taskId!),
                      const Gap(kBottomSpace),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
