import 'package:flutter/material.dart';
import 'package:tasky_app/feature/auth/data/model/login_model.dart';

import '../../../../../core/widgets/custom_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this.loginModel, {super.key});
  final LoginModel loginModel ;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      title: "Sign in",
    );
  }
}
