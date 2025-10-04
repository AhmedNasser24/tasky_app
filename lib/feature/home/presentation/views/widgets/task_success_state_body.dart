import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_empty_state_body.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/task_model.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';
import 'task_item.dart';

class TaskSuccessStateBody extends StatefulWidget {
  const TaskSuccessStateBody({super.key, this.state});
  final FetchTaskSuccess? state;
  @override
  State<TaskSuccessStateBody> createState() => _TaskSuccessStateBodyState();
}

class _TaskSuccessStateBodyState extends State<TaskSuccessStateBody> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        BlocProvider.of<TaskOperationCubit>(context).fetchData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasksList = widget.state?.tasksList ??
        BlocProvider.of<TaskOperationCubit>(context).tasksList ??
        [];
    bool isThereMoreItems =
        BlocProvider.of<TaskOperationCubit>(context).isThereMoreItems;
    String currFilter = BlocProvider.of<TaskOperationCubit>(context).currFilter;
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        BlocProvider.of<TaskOperationCubit>(context).refresh();
      },
      child: tasksList.isEmpty
          ? const TaskEmptyStateBody()
          : ListView.builder(
              controller: controller,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: tasksList.length + (isThereMoreItems ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < tasksList.length) {
                  tasksList[index].currIndex =
                      index; // to be used in editing task
                  return showTaskItemAfterFilter(currFilter, tasksList, index);
                } else {
                  return GestureDetector(
                    onTap: () => BlocProvider.of<TaskOperationCubit>(context)
                        .fetchData(),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                }
              },
            ),
    );
  }

  Widget showTaskItemAfterFilter(
      String currFilter, List<TaskModel> tasksList, int index) {
    if (currFilter == kAll) {
      return TaskItem(taskModel: tasksList[index]);
    } else {
      if (currFilter.toLowerCase() == tasksList[index].status!.toLowerCase()) {
        return TaskItem(taskModel: tasksList[index]);
      } else {
        return const SizedBox();
      }
    }
  }
}
