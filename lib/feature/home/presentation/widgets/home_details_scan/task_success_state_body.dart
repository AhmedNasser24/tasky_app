import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/skeletonizer/task_item_skeletonizer.dart';
import '../../../../../core/extensions/media_query_extension.dart';
import '../../../../../core/widgets/pagination/custom_pagination.dart';
import 'task_empty_state_body.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../domain/entities/task_entity.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';
import 'task_item.dart';

class TaskSuccessStateBody extends StatelessWidget {
  const TaskSuccessStateBody({super.key, this.state});
  final FetchTaskSuccess? state;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TaskOperationCubit>(context);
    List<TaskEntity>? tasks = state?.tasksList ?? cubit.tasksList;
    List<TaskEntity> tasksListAccordingToFilter =
        showTaskItemAfterFilter(context ,tasks);

    
    return CustomPagination<TaskEntity>(
      isLoading: cubit.isLoading,
      isThereMoreItems: cubit.isThereMoreItems,
      onLoadMoreData: () {
        cubit.fetchData();
      },
      items: tasksListAccordingToFilter,
      itemBuilder: (item) => TaskItem(taskModel: item),
      skeletonizerBuilder: () => const TaskItemSkeletonizer(),
      emptyWidget: const TaskEmptyStateBody(),
      crossAxisCount: responsiveCrossAxisCount(context).toInt(),
      childAspectRatio: aspectRatioToShowChildWithFixedHeight(context),
    );
  }

  double responsiveHeight(double screenWidth) {
    if (screenWidth < 700) {
      return 65;
    } else if (screenWidth < 1200) {
      return 70;
    } else if (screenWidth < 1500) {
      return 75;
    } else {
      return 80;
    }
  }

  List<TaskEntity> showTaskItemAfterFilter(BuildContext context , List<TaskEntity>? tasksList) {
    if (tasksList == null) return [];
    // the usage of index is for deleting and editing in cubit
    for (int index = 0; index < tasksList.length; index++) {
      tasksList[index].currIndex = index;
    }
    String currFilter = BlocProvider.of<TaskOperationCubit>(context).currFilter;
    List<TaskEntity> tasksListAccordingToFilter = [];
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

  double aspectRatioToShowChildWithFixedHeight(BuildContext context) {
    double screenWidth = context.screenWidth;
    double fixedHeight = responsiveHeight(screenWidth);
    double crossAxisCount = responsiveCrossAxisCount(context);
    double crossAxisSpacing = 10;
    return ((screenWidth / crossAxisCount) -
            (kHorizontalPadding * 2) -
            (crossAxisSpacing * (crossAxisCount - 1))) /
        fixedHeight; // this calculation to make fixed height
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
