import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/show_snack_bar.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/model/user_info_model.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key, required this.loginModel, required this.formKey});
  final UserInfoModel loginModel;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (loginModel.phone == null) {
          showSnackBarFailure(context, "phone is required");
          return;
        }
        if (formKey.currentState!.validate()) {
          BlocProvider.of<LoginCubit>(context)
              .login(loginModelInput: loginModel);
        }
      },
      title: "Sign in",
    );
  }
}
