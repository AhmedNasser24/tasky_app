import 'package:flutter/material.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_title_and_desc.dart';
import '../../../../../core/models/task_model.dart';
import 'details_app_bar.dart';
import 'details_task_image.dart';

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
          DetailsTaskImage(imgUrl: taskModel.image!),
          Align(
            alignment: Alignment.centerLeft,
            child: TaskTitleAndDesc(taskModel),
          ),
          
        ],
      ),
    );
  }
}
