import 'package:flutter/material.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/feature/home/data/models/filter_model.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/all_task_list_view.dart';

import 'filter_item.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filterModelList.asMap().entries.map((e) {
            int index = e.key;
            FilterModel filterModel = e.value;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: FilterItem(
                text: filterModel.title,
                isActive: selectedIndex == index,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  List < FilterModel > filterModelList = const [
    FilterModel(title: kAll , widget: AllTaskListView(filterAccordingTo: "all")),
    FilterModel(title: kInprogress , widget: AllTaskListView(filterAccordingTo: "waiting")),
    FilterModel(title: kWaiting , widget: AllTaskListView(filterAccordingTo: kWaiting)),
    FilterModel(title: kFinished , widget: AllTaskListView(filterAccordingTo: kFinished)),

  ];
}
