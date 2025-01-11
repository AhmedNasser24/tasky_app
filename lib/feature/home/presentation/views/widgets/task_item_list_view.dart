import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/home/presentation/manager/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/damy_task_item.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_item.dart';

import '../../../data/models/task_model.dart';
// import 'package:tasky_app/feature/home/data/models/task_model.dart';

class TaskItemListView extends StatelessWidget {
  const TaskItemListView({
    super.key,
    required this.filterAccordingTo,
    this.taskModelList,
  });
  final String filterAccordingTo;
  final List<TaskModel>? taskModelList;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await BlocProvider.of<FetchDataCubit>(context).fetchData();
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: taskModelList?.length ?? 5 ,
        itemBuilder: (context, index) => taskModelList == null
            ? const DamyTaskItem()
            : TaskItem(taskModel: taskModelList![index]),
      ),
    );
  }
}
