import 'package:flutter/material.dart';
import 'package:tasky_app/feature/auth/data/model/login_model.dart';
import 'package:tasky_app/feature/auth/presentation/views/widgets/custom_intl_phone_field.dart';

class LoginPhone extends StatelessWidget {
  const LoginPhone(
    this.loginModel, {
    super.key,
  });
  final LoginModel loginModel;
  @override
  Widget build(BuildContext context) {
    return CustomIntlPhoneField(
      onChanged: (phone) {
        loginModel.phone = "${phone.countryCode}${phone.number}";
      },
    );
  }
}
