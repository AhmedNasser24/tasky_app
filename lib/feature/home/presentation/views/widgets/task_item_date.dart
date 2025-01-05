import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/app_styles.dart';

class TaskItemDate extends StatelessWidget {
  const TaskItemDate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "30/12/2022",
      style: AppStyles.regular12,
    );
  }
}
