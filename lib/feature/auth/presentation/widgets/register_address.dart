import 'package:flutter/material.dart';

import '../../domain/entities/user_info_entity.dart';
import '../../../../core/widgets/custom_textformfield.dart';

class RegisterAddress extends StatelessWidget {
  const RegisterAddress(this.userInfoModel, {super.key});
  final UserInfoEntity userInfoModel;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Address...",
      onChanged: (address) => userInfoModel.address = address,
      validator: (address) {
        if (address == null || address.isEmpty) return "field is required";
        return null;
      },
    );
  }
}
