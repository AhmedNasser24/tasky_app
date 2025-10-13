import 'package:flutter/material.dart';
import '../../domain/entities/task_entity.dart';

import '../widgets/create_edit_widgets/edit_view_body_bloc_consumer.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.taskEntity});
  final TaskEntity taskEntity;
  static const routeName = '/edit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EditViewBodyBlocConsumer(taskEntity: taskEntity),
      ),
    );
  }
}
