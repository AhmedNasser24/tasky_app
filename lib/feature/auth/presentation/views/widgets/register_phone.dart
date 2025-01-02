import 'package:flutter/material.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';
import 'package:tasky_app/feature/auth/presentation/views/widgets/custom_intl_phone_field.dart';

class RegisterPhone extends StatelessWidget {
  const RegisterPhone(
    this.userInfoModel, {
    super.key,
  });
  final UserInfoModel userInfoModel;
  @override
  Widget build(BuildContext context) {
    return CustomIntlPhoneField(
      onChanged: (phone) {
        userInfoModel.phone = phone.toString();
      },
      
    );
  }
}
