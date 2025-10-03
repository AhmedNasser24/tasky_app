import 'package:flutter/material.dart';
import 'package:tasky_app/core/models/task_model.dart';

import 'widgets/edit_view_body_bloc_consumer.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.taskModel});
  final TaskModel taskModel;
  static const routeName = '/edit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EditViewBodyBlocConsumer(taskModel: taskModel),
      ),
    );
  }
}
