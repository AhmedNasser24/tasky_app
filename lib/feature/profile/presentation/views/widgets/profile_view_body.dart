import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/utils/shared_preference_singleton.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';
import 'package:tasky_app/feature/profile/presentation/views/widgets/profile_text_form_field.dart';

import 'profile_app_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfoModel profileData = UserInfoModel(
      phone: SharedPreferenceSingleton.getString(ApiKeys.phone),
      userName: SharedPreferenceSingleton.getString(ApiKeys.displayName),
      address: SharedPreferenceSingleton.getString(ApiKeys.address),
      experienceLevel: SharedPreferenceSingleton.getString(ApiKeys.level),
      yearsOfExperience:
          SharedPreferenceSingleton.getInt(ApiKeys.experienceYears),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const ProfileAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: [
                      const Gap(10),
                      ProfileTextFormField(
                        title: "Name",
                        subTitle: profileData.userName!,
                      ),
                      ProfileTextFormField(
                        title: "Phone",
                        subTitle: profileData.phone!,
                        copy: true,
                      ),
                      ProfileTextFormField(
                        title: "Level",
                        subTitle: profileData.experienceLevel!,
                      ),
                      ProfileTextFormField(
                        title: "Years of experience",
                        subTitle: profileData.yearsOfExperience!.toString(),
                      ),
                      ProfileTextFormField(
                        title: "Location",
                        subTitle: profileData.address!,
                      ),
                      const Gap(kBottomSpace),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
