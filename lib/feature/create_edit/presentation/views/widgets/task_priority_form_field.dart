import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/utils/app_images.dart';

import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';

class TaskPriorityFormField extends StatefulWidget {
  const TaskPriorityFormField(this.taskModel , {super.key});
  final TaskModel taskModel ;

  @override
  State<TaskPriorityFormField> createState() => _TaskPriorityFormFieldState();
}

class _TaskPriorityFormFieldState extends State<TaskPriorityFormField> {
  final valueListenable = ValueNotifier<String?>(null);
  late Color iconColor ;

  @override
  void initState() {
    iconColor = AppColor.greyColor;
    valueListenable.value = widget.taskModel.priority?.toLowerCase();
    changeIconColor(valueListenable.value);
    super.initState();
  }
  void changeIconColor(String? value) {
    if (value == null) return;
    if (value == kLow.toLowerCase()) {
      iconColor = AppColor.blueColor;
    } else if (value == kMedium.toLowerCase()) {
      iconColor = AppColor.primaryColor;
    } else if (value == kHigh.toLowerCase()) {
      iconColor = AppColor.orangeColor;
    }
    setState(() {});
  }
   @override
  dispose(){
    valueListenable.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      
      child: DropdownButton2<String>(
        
        isExpanded: true,
        hint: Text(
          'Select Priority',
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
          widget.taskModel.priority = value?.toLowerCase();
          log("value $value ") ;
          log("widget.taskModel.priority ${widget.taskModel.priority}" ) ;
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
      "widget": Row(children: [
        SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(Assets.imagesLowFlag)),
        const Gap(8),
        Text(
          "$kLow Priority",
          style: AppStyles.bold16.copyWith(color: AppColor.blueColor),
        ),
      ]),
      "value": kLow.toLowerCase(),
    },
    {
      "widget": Row(children: [
        SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(Assets.imagesMediumFlag)),
        const Gap(8),
        Text(
          "$kMedium Priority",
          style: AppStyles.bold16.copyWith(color: AppColor.primaryColor),
        ),
      ]),
      "value": kMedium.toLowerCase(),
    },
    {
      "widget": Row(children: [
        SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(Assets.imagesHeighFlag)),
        const Gap(8),
        Text(
          "$kHigh Priority",
          style: AppStyles.bold16.copyWith(color: AppColor.orangeColor),
        ),
      ]),
      "value": kHigh.toLowerCase(),
    },
  ];
}
