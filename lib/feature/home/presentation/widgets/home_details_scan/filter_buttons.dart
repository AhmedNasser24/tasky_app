import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';

import '../../manager/task_operation_cubit/task_operation_cubit.dart';
import 'filter_item.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({
    super.key,
  });
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
          children: filterTitleList.asMap().entries.map(
            (e) {
              int index = e.key;
              String filterName = e.value;
              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      selectedIndex = index;
                    },
                  );
                  BlocProvider.of<TaskOperationCubit>(context)
                      .changeFilter(filterName);
                  navToSection(index);
                },
                child: FilterItem(
                  key: navBarKeys[index],
                  text: filterName,
                  isActive: selectedIndex == index,
                ),
              );
            },
          ).toList(),
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
