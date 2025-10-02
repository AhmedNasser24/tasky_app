import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class TaskEmptyStateBody extends StatelessWidget {
  const TaskEmptyStateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text(
            " No Tasks yet in this category",
            style: AppStyles.semibold16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
