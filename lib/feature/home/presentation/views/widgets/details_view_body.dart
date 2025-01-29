import 'package:flutter/material.dart';

import '../../../../../core/models/task_model.dart';
import 'details_app_bar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DetailsAppBar(taskModel: taskModel),
        ],
      ),
    );
  }
}
