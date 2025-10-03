import 'package:flutter/material.dart';

import '../../../../core/models/task_model.dart';
import 'widgets/details_view_body_bloc_consumer.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.taskModel});
  final TaskModel taskModel;
  static const String routeName = "DetailsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetailsViewBodyBlocConsumer(
          taskModel: taskModel,
        ),
      ),
    );
  }
}
