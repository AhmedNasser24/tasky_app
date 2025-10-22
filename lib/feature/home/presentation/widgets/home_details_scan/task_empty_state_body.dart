import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_color.dart';

import '../../../../../core/utils/theme/app_font_styles.dart';

class TaskEmptyStateBody extends StatelessWidget {
  const TaskEmptyStateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        " No Tasks yet in this category",
        style: AppStyles.semibold16.copyWith(color: AppColor.primaryColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
