import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/setting_icon_button.dart';

import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_back_arrow_button.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key , required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:  [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding, vertical: 12.0),
          child: Stack(
            children: [
              Positioned(
                left: -5,
                top: -5,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CustomBackArrowButton(),
                ),
              ),
              Row(
                children: [
                  Gap(35),
                  Text('Edit task', style: AppStyles.bold16),
                ],
              ),
            ],

          ),
        ),
        Positioned(child: SettingIconButton(taskModel: taskModel))
      ],
      
    );
  }
}
