import 'package:flutter/material.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';

import '../../../../../core/widgets/custom_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton(this.userInfoModel, {super.key});
  final UserInfoModel userInfoModel ;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {},
      title: "Sign up",
    );
  }
}
