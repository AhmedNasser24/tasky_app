import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../create_edit/presentation/views/edit_view.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';
import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class SettingIconButton extends StatelessWidget {
  const SettingIconButton({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 42),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
          showDeleteDialog(context, () {
            BlocProvider.of<TaskOperationCubit>(context)
                .deleteTask(taskModel: taskModel);
          });
        } else if (value == 'edit') {
          Navigator.pushNamed(
            context,
            EditView.routeName,
            arguments: taskModel,
          );
        }
      },
    );
  }

  void showDeleteDialog(BuildContext context, VoidCallback onDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close the dialog
              child: Text("Cancel",
                  style:
                      AppStyles.medium16.copyWith(color: AppColor.blueColor)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                onDelete(); // Perform the delete action
              },
              child: Text("Delete",
                  style: AppStyles.medium16.copyWith(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
