import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/helper/media_query_extension.dart';
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
    List<TaskModel> tasksListAccordingToFilter =
        showTaskItemAfterFilter(widget.state?.tasksList);
    bool isThereMoreItems =
        BlocProvider.of<TaskOperationCubit>(context).isThereMoreItems;

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        BlocProvider.of<TaskOperationCubit>(context).refresh();
      },
      child: tasksListAccordingToFilter.isEmpty
          ? const TaskEmptyStateBody()
          : GridView.builder(
              controller: controller,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    responsiveCrossAxisCount(context).toInt(), // number of columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 24,
                // mainAxisExtent: 150, // 👈 fixed height for each item!
                childAspectRatio: 
                    aspectRatioToShowChildWithFixedHeight(context),
              ),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: tasksListAccordingToFilter.length +
                  (isThereMoreItems ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < tasksListAccordingToFilter.length) {
                  tasksListAccordingToFilter[index].currIndex =
                      index; // to be used in editing task
                  return TaskItem(taskModel: tasksListAccordingToFilter[index]);
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
    double responsiveHeight(double screenWidth){
    if (screenWidth < 700) {
      return 60 ;
    }else if ( screenWidth < 1000) {
      return 65;
    }else if (screenWidth < 1200) {
      return 70;
    }else if (screenWidth < 1500){
      return 75;
    }else {
      return 80 ;
    }
  }

  double aspectRatioToShowChildWithFixedHeight(BuildContext context) {
    double screenWidth = context.screenWidth;
    double fixedHeight = responsiveHeight(screenWidth);
    double crossAxisCount = responsiveCrossAxisCount(context);
    double crossAxisSpacing = 10;
    return ((screenWidth / crossAxisCount) -
            (kHorizontalPadding * 2) -
            (crossAxisSpacing * (crossAxisCount - 1))) /
        fixedHeight;
  }

  List<TaskModel> showTaskItemAfterFilter(List<TaskModel>? tasksList) {
    if (tasksList == null) return [];
    String currFilter = BlocProvider.of<TaskOperationCubit>(context).currFilter;
    List<TaskModel> tasksListAccordingToFilter = [];
    if (currFilter == kAll) {
      tasksListAccordingToFilter = tasksList;
    } else {
      for (var task in tasksList) {
        if (task.status!.toLowerCase() == currFilter.toLowerCase()) {
          tasksListAccordingToFilter.add(task);
        }
      }
    }
    return tasksListAccordingToFilter;
  }

  double responsiveCrossAxisCount(BuildContext context) {
    double screenWidth = context.screenWidth;
    if (screenWidth < 720) {
      return 1;
    } else if (screenWidth < 1200) {
      return 2;
    } else {
      return 3;
    }
  }
}
