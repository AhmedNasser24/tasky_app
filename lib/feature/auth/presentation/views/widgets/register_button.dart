import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';

import '../../../../../core/widgets/custom_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton( {super.key, required this.userInfoModel, required this.formKey});
  final UserInfoModel userInfoModel ;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          log("Register Success");
        }
      },
      title: "Sign up",
    );
  }
}
