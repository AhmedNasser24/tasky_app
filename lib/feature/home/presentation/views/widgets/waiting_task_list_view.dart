import 'package:flutter/material.dart';
// import 'package:tasky_app/feature/home/data/models/task_model.dart';

class WaitingTaskListView extends StatelessWidget {
  const WaitingTaskListView({
    super.key,
    required this.filterAccordingTo,
  });
  final String filterAccordingTo;
  // final TaskModel data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(filterAccordingTo),
      ],
    );
  }
}
