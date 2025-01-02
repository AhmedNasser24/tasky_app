import 'package:flutter/material.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/utils/app_images.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';
import 'package:tasky_app/feature/auth/presentation/views/widgets/already_have_account.dart';
import 'package:tasky_app/feature/auth/presentation/views/widgets/register_password.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/feature/auth/presentation/views/widgets/register_years_of_experience.dart';
import 'register_address.dart';
import 'register_button.dart';
import 'register_name.dart';
import 'register_phone.dart';
import 'select_experience_textformfield.dart';
import 'title_widget.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  UserInfoModel userInfoModel = UserInfoModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesRegisterLogo),
              const TitleWidget("Register"),
              const Gap(15),
              RegisterName(userInfoModel),
              const Gap(10),
              RegisterPhone(userInfoModel),
              const Gap(10),
              RegisterYearsOfExperience(userInfoModel),
              const Gap(10),
              SelectedExperienceTextFormField(userInfoModel),
              const Gap(10),
              RegisterAddress(userInfoModel),
              const Gap(10),
              RegisterPassword(userInfoModel),
              const Gap(15),
              RegisterButton(userInfoModel),
              const Gap(10),
              const AlreadyHaveAccount(),
              const Gap(kBottomSpace),
            ],
          ),
        ),
      ),
    );
  }
}
