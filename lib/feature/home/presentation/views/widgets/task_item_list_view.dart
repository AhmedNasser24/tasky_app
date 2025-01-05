import 'package:flutter/material.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_item.dart';
// import 'package:tasky_app/feature/home/data/models/task_model.dart';

class AllTaskListView extends StatelessWidget {
  const AllTaskListView({
    super.key,
    required this.filterAccordingTo,
  });
  final String filterAccordingTo;
  // final TaskModel data;
  @override
  Widget build(BuildContext context) {
    return const TaskItem();
  }
}
