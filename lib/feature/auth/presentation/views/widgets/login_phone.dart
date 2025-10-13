import 'package:flutter/material.dart';
import 'custom_intl_phone_field.dart';

import '../../../data/model/user_info_model.dart';

class LoginPhone extends StatelessWidget {
  const LoginPhone(
    this.loginModel, {
    super.key,
  });
  final UserInfoModel loginModel;
  @override
  Widget build(BuildContext context) {
    return CustomIntlPhoneField(
      onChanged: (phone) {
        loginModel.phone = "${phone.countryCode}${phone.number}";
      },
    );
  }
}
