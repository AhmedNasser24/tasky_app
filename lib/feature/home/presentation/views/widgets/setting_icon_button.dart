import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/models/task_model.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../create_edit/presentation/views/edit_view.dart';

class SettingIconButton extends StatelessWidget {
  const SettingIconButton({
    required this.taskModel,
    super.key,
  });
  final TaskModel taskModel ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditView(taskModel: taskModel)));
      },
      child: SvgPicture.asset(Assets.imagesSettingIcon),
    );
    
  }
}
