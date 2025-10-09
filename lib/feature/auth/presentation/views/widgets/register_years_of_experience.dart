import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/model/user_info_model.dart';
import '../../../../../core/widgets/custom_textformfield.dart';

class RegisterYearsOfExperience extends StatelessWidget {
  const RegisterYearsOfExperience(this.userInfoModel, {super.key});
  final UserInfoModel userInfoModel;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Years of experience...",
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // 👈 only allows 0–9
      ],
      validator: (yearsOfExperience) {
        if (yearsOfExperience == null || yearsOfExperience.isEmpty) {
          return "field is required";
        }
        if (int.tryParse(yearsOfExperience) == null) {
          return "field must be numbers only";
        }
        if (int.parse(yearsOfExperience) <= 0) {
          return "field must be greater than or equal 0";
        }
        if (int.parse(yearsOfExperience) > 50) {
          return "field must be less than 40";
        }
        userInfoModel.yearsOfExperience = int.parse(yearsOfExperience);
        return null;
      },
    );
  }
}
