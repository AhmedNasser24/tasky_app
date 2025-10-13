import 'package:flutter/material.dart';
import '../../domain/entities/user_info_entity.dart';
import 'custom_intl_phone_field.dart';

class RegisterPhone extends StatelessWidget {
  const RegisterPhone(
    this.userInfoModel, {
    super.key,
  });
  final UserInfoEntity userInfoModel;
  @override
  Widget build(BuildContext context) {
    return CustomIntlPhoneField(
      onChanged: (phone) {
        userInfoModel.phone = "${phone.countryCode}${phone.number}";
      },
      
    );
  }
}
