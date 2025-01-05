import 'package:flutter/material.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_item.dart';
// import 'package:tasky_app/feature/home/data/models/task_model.dart';

class TaskItemListView extends StatelessWidget {
  const TaskItemListView({
    super.key,
    required this.filterAccordingTo,
  });
  final String filterAccordingTo;
  // final TaskModel data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) => const TaskItem(),
    );
  }
}
