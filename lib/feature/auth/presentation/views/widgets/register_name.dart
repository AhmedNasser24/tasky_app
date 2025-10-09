import 'package:flutter/material.dart';

import '../../../data/model/user_info_model.dart';
import '../../../../../core/widgets/custom_textformfield.dart';

class RegisterName extends StatelessWidget {
  const RegisterName(this.userInfoModel, {super.key});
  final UserInfoModel userInfoModel ;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      
      hintText: "Name...",
      onChanged: (name) => userInfoModel.userName = name,
      validator: (name) {
        if (name == null || name.isEmpty) return "field is required";
        return null;
      },
    );
  }
}
