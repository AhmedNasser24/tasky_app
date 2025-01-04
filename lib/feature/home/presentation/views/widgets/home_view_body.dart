import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/filter_buttons.dart';

import 'all_task_list_view.dart';
import 'home_app_bar.dart';
import 'my_task_text.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

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
      currFilter = currFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeAppBar(),
            const Gap(24),
            const MyTaskText(),
            FilterButtons(selectFilter),
            selectWidgetAccordingToFilter(),
          ],
        ),
      ),
    );
  }

  Widget selectWidgetAccordingToFilter() {
    switch (currFilter) {
      case kAll:
        return const AllTaskListView(filterAccordingTo: kAll);
      case kWaiting:
        return const AllTaskListView(filterAccordingTo: kWaiting);
      case kInprogress:
        return const AllTaskListView(filterAccordingTo: kInprogress);
      case kFinished:
        return const AllTaskListView(filterAccordingTo: kFinished);
      default:
        return const SizedBox();
    }
  }
}
