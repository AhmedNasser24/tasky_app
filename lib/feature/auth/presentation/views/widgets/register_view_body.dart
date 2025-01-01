import 'package:flutter/material.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/utils/app_images.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';
import 'package:tasky_app/feature/auth/presentation/views/widgets/register_password.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/feature/auth/presentation/views/widgets/register_years_of_experience.dart';
import '../../../../../core/utils/app_styles.dart';
import 'custom_intl_phone_field.dart';
import 'register_address.dart';
import 'register_name.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  UserInfoModel userInfoModel = UserInfoModel();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.imagesRegisterLogoCopy),
            const Text("Register", style: AppStyles.bold24),
            const Gap(15),
            RegisterName(userInfoModel),
            const Gap(10),
            CustomIntlPhoneField(userInfoModel),
            const Gap(10),
            RegisterYearsOfExperience(userInfoModel),
            const Gap(10),
            RegisterAddress(userInfoModel),
            const Gap(10),
            RegisterPassword(userInfoModel),
          ],
        ),
      ),
    );
  }
}
