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

class TaskSuccessStateBody extends StatefulWidget {
  const TaskSuccessStateBody({super.key, this.state});
  final FetchTaskSuccess? state;

  @override
  State<TaskSuccessStateBody> createState() => _TaskSuccessStateBodyState();
}

class _TaskSuccessStateBodyState extends State<TaskSuccessStateBody> {
  final ScrollController controller = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TaskOperationCubit>(context);
    List<TaskEntity>? tasks = widget.state?.tasksList ?? cubit.tasksList;
    List<TaskEntity> tasksListAccordingToFilter =
        showTaskItemAfterFilter(tasks);


   

    return CustomPagination<TaskEntity>(
      scrollController : controller,
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

  List<TaskEntity> showTaskItemAfterFilter( List<TaskEntity>? tasksList) {
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



// class TaskSuccessStateBody extends StatefulWidget {
//   const TaskSuccessStateBody({super.key, this.state});
//   final FetchTaskSuccess? state;

//   @override
//   State<TaskSuccessStateBody> createState() => _TaskSuccessStateBodyState();
// }

// class _TaskSuccessStateBodyState extends State<TaskSuccessStateBody> {
//   final ScrollController controller = ScrollController();
//   @override
  // void initState() {
    // final cubit = BlocProvider.of<TaskOperationCubit>(context);
  //   controller.addListener(() {
      // log("isLoading : ${cubit.isLoading}");
  //     if (controller.position.pixels >=
  //             controller.position.maxScrollExtent - 200 &&
  //         cubit.isThereMoreItems &&
  //         !cubit.isLoading) {
  //       cubit.fetchData();
  //     }
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
  // @override
  // Widget build(BuildContext context) {
  //   final cubit = BlocProvider.of<TaskOperationCubit>(context);
  //   List<TaskEntity>? tasks = widget.state?.tasksList ?? cubit.tasksList;
  //   List<TaskEntity> tasksListAccordingToFilter =
  //       showTaskItemAfterFilter(tasks);


    // 👇 Add this post-frame check
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (controller.hasClients &&
    //       controller.position.maxScrollExtent == 0 &&
    //       cubit.isThereMoreItems &&
    //       !cubit.isLoading) {
    //     cubit.fetchData();
    //   }
    // });
    // log ("isThereMoreItems : ${cubit.isThereMoreItems}");
    // return
    //  tasksListAccordingToFilter.isEmpty && !cubit.isThereMoreItems
    //     ? const TaskEmptyStateBody()
    //     :
    //     GridView.builder(
    //         controller: controller,
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: responsiveCrossAxisCount(context)
    //               .toInt(), // number of columns
    //           crossAxisSpacing: 10,
    //           mainAxisSpacing: 24,
    //           childAspectRatio: aspectRatioToShowChildWithFixedHeight(context),
    //         ),
    //         physics: const AlwaysScrollableScrollPhysics(),
    //         itemCount:
    //             tasksListAccordingToFilter.length + (cubit.isThereMoreItems ? 1 : 0),
    //         itemBuilder: (context, index) {
    //           if (index < tasksListAccordingToFilter.length) {

    //             return TaskItem(taskModel: tasksListAccordingToFilter[index]);
    //           } else {
    //             return GestureDetector(
    //               onTap: () =>
    //                   BlocProvider.of<TaskOperationCubit>(context).fetchData(),
    //               child: const Padding(
    //                 padding: EdgeInsets.all(16.0),
    //                 child: Center(child: CircularProgressIndicator()),
    //               ),
    //             );
    //           }
    //         },
    //       );
   