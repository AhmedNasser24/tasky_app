import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../constants.dart';
import '../../../../../core/helper/media_query_extension.dart';
import 'generate_qr_code.dart';
import 'task_title_and_desc.dart';
import '../../../../../core/models/task_model.dart';
import '../../../../create_edit/presentation/views/widgets/details_priority.dart';
import 'details_app_bar.dart';
import 'details_statues.dart';
import 'details_task_image.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DetailsAppBar(taskModel: taskModel),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              screenWidth < 800
                  ? const SizedBox()
                  : DetailsTaskImage(imgUrl: taskModel.image!),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      screenWidth < 800
                          ? DetailsTaskImage(imgUrl: taskModel.image!)
                          : const SizedBox(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TaskTitleAndDesc(taskModel),
                      ),
                      const Gap(8),
                      DetailsStatues(taskModel.status!),
                      DetailsPriority(taskModel.priority!),
                      const Gap(16),
                      GenerateQrCode(taskId: taskModel.taskId!),
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
