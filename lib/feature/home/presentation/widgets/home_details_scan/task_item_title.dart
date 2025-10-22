
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_font_styles.dart';

class TaskItemTitle extends StatelessWidget {
  const TaskItemTitle(this.title ,{
    super.key,
  });
  final String title ;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.bold16,
      overflow: TextOverflow.ellipsis,
    );
  }
}