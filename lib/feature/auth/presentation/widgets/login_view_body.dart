import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_images.dart';
import 'login_phone.dart';
import 'package:gap/gap.dart';
import '../../domain/entities/user_info_entity.dart';
import 'do_not_have_account.dart';
import 'login_button.dart';
import 'login_password.dart';
import 'title_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  UserInfoEntity loginModel = UserInfoEntity();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesLoginLogo),
                  const TitleWidget("Login"),
                  const Gap(15),
                  LoginPhone(loginModel),
                  const Gap(10),
                  LoginPassword(loginModel),
                  const Gap(15),
                  LoginButton(loginModel: loginModel, formKey: formKey),
                  const Gap(10),
                  const DoNotHaveAccount(),
                  const Gap(kBottomSpace),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
