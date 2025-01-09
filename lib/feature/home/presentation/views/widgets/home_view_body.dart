import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/filter_buttons.dart';

import 'task_item_list_view.dart';
import 'home_app_bar.dart';
import 'my_task_text.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.enableSkeletonizer});
  final bool enableSkeletonizer ;
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late String currFilter;

  @override
  void initState() {
    currFilter = kAll;
    super.initState();
  }

  void selectFilter(String selectFilter) {
    setState(() {
      currFilter = selectFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const HomeAppBar(),
          const Gap(24),
          const MyTaskText(),
          FilterButtons(selectFilter),
          Expanded(
            child: Skeletonizer(
              enabled: widget.enableSkeletonizer,
              child: selectWidgetAccordingToFilter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectWidgetAccordingToFilter() {
    switch (currFilter) {
      case kAll:
        return const TaskItemListView(filterAccordingTo: kAll);
      case kWaiting:
        return const TaskItemListView(filterAccordingTo: kWaiting);
      case kInprogress:
        return const TaskItemListView(filterAccordingTo: kInprogress);
      case kFinished:
        return const TaskItemListView(filterAccordingTo: kFinished);
      default:
        return const SizedBox();
    }
  }
}
