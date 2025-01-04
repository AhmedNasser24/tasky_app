import 'package:flutter/material.dart';
import 'package:tasky_app/constants.dart';

import 'filter_item.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons(
    this.selectFilter, {
    super.key,
  });
  final void Function(String selectFilter) selectFilter;
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
          children: filterTitleList.asMap().entries.map((e) {
            int index = e.key;
            String title = e.value;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: FilterItem(
                text: title,
                isActive: selectedIndex == index,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  List<String> filterTitleList = const [
    kAll,
    kInprogress,
    kWaiting,
    kFinished,
  ];
}
