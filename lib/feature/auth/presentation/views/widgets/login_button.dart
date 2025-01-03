import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/auth/data/model/login_model.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key, required this.loginModel, required this.formKey});
  final LoginModel loginModel;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (formKey.currentState!.validate()) {
          log("user info : ${loginModel.toJson()}");
          BlocProvider.of<LoginCubit>(context)
              .login(loginModelInput: loginModel);
        }
      },
      title: "Sign in",
    );
  }
}
