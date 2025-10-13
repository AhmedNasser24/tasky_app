import 'package:flutter/material.dart';

import '../../domain/entities/task_entity.dart';
import '../widgets/home_details_scan/details_view_body_bloc_consumer.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.taskEntity});
  final TaskEntity taskEntity;
  static const String routeName = "DetailsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetailsViewBodyBlocConsumer(
          taskEntity: taskEntity,
        ),
      ),
    );
  }
}
