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
  final scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(
    4,
    (index) => GlobalKey(),
  );
  void navToSection(int navIndex) {
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filterTitleList.asMap().entries.map((e) {
            int index = e.key;
            String title = e.value;
            return GestureDetector(
              onTap: () {
                setState(
                  () {
                    selectedIndex = index;
                  },
                );
                navToSection(index);
              },
              child: FilterItem(
                key: navBarKeys[index],
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
