import 'dart:developer';

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
        TaskModel test = TaskModel(title: "test" , desc: "test") ;
        // log(taskModel.toJsonEdit().toString());
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditView(taskModel: test)));
      },
      child: SvgPicture.asset(Assets.imagesSettingIcon),
    );
    
  }
}
