import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/home/presentation/manager/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/damy_task_item.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/models/task_model.dart';
// import 'package:tasky_app/feature/home/data/models/task_model.dart';

class TaskItemListView extends StatefulWidget {
  const TaskItemListView({
    super.key,
    required this.filterAccordingTo,
  });
  final String filterAccordingTo;

  @override
  State<TaskItemListView> createState() => _TaskItemListViewState();
}

class _TaskItemListViewState extends State<TaskItemListView> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        log("reached");
        BlocProvider.of<FetchDataCubit>(context).fetchData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDataCubit, FetchDataState>(
      builder: (context, state) {
        List<TaskModel>? tasksList =
            BlocProvider.of<FetchDataCubit>(context).tasksList;
        bool isThereMoreItems =
            BlocProvider.of<FetchDataCubit>(context).isThereMoreItems;
        return RefreshIndicator(
          onRefresh: () async {
            await BlocProvider.of<FetchDataCubit>(context).refresh();
          },
          child: tasksList != null
              ? ListView.builder(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: tasksList.length + (isThereMoreItems ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < tasksList.length) {
                      return TaskItem(taskModel: tasksList[index]);
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                )
              : Skeletonizer(
                  enabled: true,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await BlocProvider.of<FetchDataCubit>(context).refresh();
                    },
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (context, index) => const DamyTaskItem(),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
