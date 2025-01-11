import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/filter_buttons.dart';

import '../../../data/models/task_model.dart';
import '../../manager/fetch_data_cubit/fetch_data_cubit.dart';
import 'task_item_list_view.dart';
import 'home_app_bar.dart';
import 'my_task_text.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.enableSkeletonizer, required this.taskModelList});
  final bool enableSkeletonizer ;
  final List < TaskModel >? taskModelList ;
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late String currFilter;

  @override
  void initState() {
    currFilter = kAll;
    BlocProvider.of<FetchDataCubit>(context).fetchData() ;
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
        return  TaskItemListView(filterAccordingTo: kAll ,taskModelList: widget.taskModelList, );
      case kWaiting:
        return  TaskItemListView(filterAccordingTo: kWaiting ,taskModelList: widget.taskModelList, );
      case kInprogress:
        return  TaskItemListView(filterAccordingTo: kInprogress , taskModelList: widget.taskModelList,);
      case kFinished:
        return  TaskItemListView(filterAccordingTo: kFinished ,taskModelList: widget.taskModelList, );
      default:
        return const SizedBox();
    }
  }
}
