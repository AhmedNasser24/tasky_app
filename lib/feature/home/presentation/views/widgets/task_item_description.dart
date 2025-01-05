import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';

class TaskItemDescription extends StatelessWidget {
  const TaskItemDescription(
    this.desc, {
    super.key,
  });
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      style: AppStyles.regular14.copyWith(color: AppColor.greyColor),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
