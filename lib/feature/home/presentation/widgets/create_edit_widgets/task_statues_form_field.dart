import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../domain/entities/task_entity.dart';

class TaskStatuesFormField extends StatefulWidget {
  const TaskStatuesFormField(this.taskModel , {super.key});
  final TaskEntity taskModel ;

  @override
  State<TaskStatuesFormField> createState() => _TaskStatuesFormFieldState();
}

class _TaskStatuesFormFieldState extends State<TaskStatuesFormField> {
  final valueListenable = ValueNotifier<String?>(null);
  late Color iconColor ;

  @override
  void initState() {
    iconColor = AppColor.greyColor;
    valueListenable.value = widget.taskModel.status?.toLowerCase();
    changeIconColor(valueListenable.value);
    super.initState();
  }
  void changeIconColor(String? value) {
    if (value == null) return;
    if (value == kFinished.toLowerCase()) {
      iconColor = AppColor.blueColor;
    } else if (value == kInprogress.toLowerCase()) {
      iconColor = AppColor.primaryColor;
    } else if (value == kWaiting.toLowerCase()) {
      iconColor = AppColor.orangeColor;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      
      child: DropdownButton2<String>(
        
        isExpanded: true,
        hint: Text(
          'Select Statues',
          style: AppStyles.regular14.copyWith(color: AppColor.greyColor),
        ),
        items: items
            .map((item) => DropdownItem<String>(
                  value: item["value"],
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: item["widget"],
                  ),
                ))
            .toList(),
        dropdownSeparator: const DropdownSeparator(
          height: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(),
          ),
        ),
        valueListenable: valueListenable,
        onChanged: (value) {
          valueListenable.value = value;
          widget.taskModel.status = value?.toLowerCase();
          changeIconColor(value);
        },
        buttonStyleData: const ButtonStyleData(
          decoration: BoxDecoration(
              color: Color(0xffF0ECFF),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          // height: 40,
          width: double.infinity,
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
        iconStyleData: IconStyleData(
          openMenuIcon: Icon(
            Icons.arrow_drop_up_rounded,
            color: iconColor,
            size: 50,
          ),
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: iconColor,
            size: 50,
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> items = [
    {
      "widget": Text(
        kWaiting,
        style: AppStyles.bold16.copyWith(color: AppColor.orangeColor),
      ),
      "value": kWaiting.toLowerCase(),
    },
    {
      "widget": Text(
        kInprogress,
        style: AppStyles.bold16.copyWith(color: AppColor.primaryColor),
      ),
      "value": kInprogress.toLowerCase(),
    },
    {
      "widget": Text(
        kFinished,
        style: AppStyles.bold16.copyWith(color: AppColor.blueColor),
      ),
      "value": kFinished.toLowerCase(),
    },
  ];
}
