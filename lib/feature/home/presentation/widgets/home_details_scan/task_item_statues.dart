import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_font_styles.dart';

class TaskItemStatues extends StatelessWidget {
  const TaskItemStatues(
    this.statues, {
    super.key,
  });
  final String statues;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: ShapeDecoration(
        color: const Color(0xFFE3F2FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        statues,
        style: AppStyles.medium12
            .copyWith(color: getStatusColor(statues.toLowerCase())),
      ),
    );
  }

  Color getStatusColor(String statues) {
    Map<String, Color> statusColor = {
      kWaiting.toLowerCase(): AppColor.orangeColor,
      kInprogress.toLowerCase(): AppColor.primaryColor,
      kFinished.toLowerCase(): AppColor.blueColor,
    };

    return statusColor[statues] ?? Colors.black;
  }
}
