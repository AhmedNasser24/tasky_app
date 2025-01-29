import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/feature/create_edit/presentation/views/edit_view.dart';
import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class SettingIconButton extends StatelessWidget {
  const SettingIconButton(
      {super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 42),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),),
      color: AppColor.whiteColor,
      icon: SvgPicture.asset(Assets.imagesSettingIcon),
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'edit',
            child: Text(
              "Edit",
              style: AppStyles.medium16,
            ),
          ),
          const PopupMenuDivider(height: 4),
          PopupMenuItem<String>(
            value: 'delete',
            child: Text(
              "Delete",
              style: AppStyles.medium16.copyWith(color: AppColor.orangeColor),
            ),
          ),
        ];
      },
      onSelected: (String value) {
        if (value == 'delete') {
          // delete task
        } else if (value == 'edit') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditView(taskModel: taskModel)));
        }
      },
    );
  }
}
