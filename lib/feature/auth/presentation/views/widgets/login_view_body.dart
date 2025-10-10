import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/utils/app_images.dart';
import 'package:tasky_app/feature/auth/presentation/views/widgets/login_phone.dart';
import 'package:gap/gap.dart';
import '../../../data/model/user_info_model.dart';
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
  UserInfoModel loginModel = UserInfoModel();
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
                  // IntlPhoneField(
                  //   // focusNode: focusNode,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Phone Number',
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(),
                  //     ),
                  //   ),
                  //   languageCode: "en",
                  //   onChanged: (phone) {
                  //     print(phone.completeNumber);
                  //   },
                  //   onCountryChanged: (country) {
                  //     print('Country changed to: ${country.name}');
                  //   },
                  //   validator: (phone) {
                  //     if (phone == null || phone.number.isEmpty) {
                  //       return 'Phone number is required';
                  //     }
                  //     return null;
                  //   },
                  // ),
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
