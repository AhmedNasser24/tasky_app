import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/task_model.dart';
import '../../manager/fetch_task_cubit/fetch_task_cubit.dart';
import 'task_item.dart';

class TaskSuccessStateBody extends StatefulWidget {
  const TaskSuccessStateBody({super.key, required this.state});
  final FetchTaskSuccess state;
  @override
  State<TaskSuccessStateBody> createState() => _TaskSuccessStateBodyState();
}

class _TaskSuccessStateBodyState extends State<TaskSuccessStateBody> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        BlocProvider.of<FetchTaskCubit>(context).fetchData();
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
    List<TaskModel> tasksList = widget.state.tasksList;
    bool isThereMoreItems =
        BlocProvider.of<FetchTaskCubit>(context).isThereMoreItems;
    String currFilter = BlocProvider.of<FetchTaskCubit>(context).currFilter;
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        BlocProvider.of<FetchTaskCubit>(context).refresh();
      },
      child: ListView.builder(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: tasksList.length + (isThereMoreItems ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < tasksList.length) {
            return showTaskItemAfterFilter(currFilter, tasksList, index);
          } else {
            return GestureDetector(
              onTap: () => BlocProvider.of<FetchTaskCubit>(context).fetchData(),
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

  Widget showTaskItemAfterFilter(String currFilter, List<TaskModel> tasksList, int index) {
    if (currFilter == kAll) {
      return TaskItem(taskModel: tasksList[index]);
    } else {
      if (currFilter.toLowerCase() ==
          tasksList[index].status!.toLowerCase()) {
        return TaskItem(taskModel: tasksList[index]);
      } else {
        return const SizedBox();
      }
    }
  }
}
