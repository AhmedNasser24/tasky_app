import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_back_arrow_button.dart';
import '../../../domain/entities/task_entity.dart';
import 'setting_icon_button.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key, required this.taskEntity});
  final TaskEntity taskEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kHorizontalPadding, vertical: 12.0),
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
                  Text('Task Details', style: AppStyles.bold16),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: SettingIconButton(taskEntity: taskEntity))
      ],
    );
  }
}
