import 'package:flutter/material.dart';

import '../../../data/model/user_info_model.dart';
import 'custom_textformfield.dart';

class RegisterYearsOfExperience extends StatelessWidget {
  const RegisterYearsOfExperience(this.userInfoModel, {super.key});
  final UserInfoModel userInfoModel ;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Years of experience...",
      keyboardType: TextInputType.number,
      onSaved: (yearsOfExperience) => userInfoModel.yearsOfExperience = yearsOfExperience,
      validator: (yearsOfExperience) {
        if (yearsOfExperience == null || yearsOfExperience.isEmpty) return "field is required";
        return null;
      },
    );
  }
}
