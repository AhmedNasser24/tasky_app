import 'package:flutter/material.dart';
import '../../../data/model/user_info_model.dart';
import 'custom_intl_phone_field.dart';

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
        userInfoModel.phone = "${phone.countryCode}${phone.number}";
      },
      
    );
  }
}
