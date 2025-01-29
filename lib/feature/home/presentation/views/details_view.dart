import 'package:flutter/material.dart';

import '../../../../core/models/task_model.dart';
import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key , required this.taskModel});
  final TaskModel taskModel ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DetailsViewBody(taskModel: taskModel,),
      ),
    );
  }
}