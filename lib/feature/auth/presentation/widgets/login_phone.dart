import 'package:flutter/material.dart';
import 'custom_intl_phone_field.dart';

import '../../domain/entities/user_info_entity.dart';

class LoginPhone extends StatelessWidget {
  const LoginPhone(
    this.loginModel, {
    super.key,
  });
  final UserInfoEntity loginModel;
  @override
  Widget build(BuildContext context) {
    return CustomIntlPhoneField(
      onChanged: (phone) {
        loginModel.phone = "${phone.countryCode}${phone.number}";
      },
    );
  }
}
