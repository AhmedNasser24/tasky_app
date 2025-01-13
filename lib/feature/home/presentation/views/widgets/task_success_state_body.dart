import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../data/models/task_model.dart';
import '../../manager/fetch_task_cubit/fetch_task_cubit.dart';
import 'task_item.dart';

class TaskSuccessStateBody extends StatefulWidget {
  const TaskSuccessStateBody({super.key, required this.state});
  final FetchTaskSuccess state ;
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: RefreshIndicator(
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
                    return TaskItem(taskModel: tasksList[index]);
                  } else {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
            ),
          );
  }
}