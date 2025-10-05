import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/helper/media_query_extension.dart';
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
          // constraints: const BoxConstraints(maxWidth: 550),
          // alignment: Alignment.topCenter,
          child: Column(
            children: [
              const ProfileAppBar(),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:context.screenWidth < 800 ? 1 : 2, // number of columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // mainAxisExtent: 150, // 👈 fixed height for each item!
                childAspectRatio: 
                    aspectRatioToShowChildWithFixedHeight(context),
              ),
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }
  double aspectRatioToShowChildWithFixedHeight(BuildContext context) {
    double screenWidth = context.screenWidth;
    double fixedHeight = 85;
    double crossAxisCount = screenWidth < 800 ? 1 : 2;
    double crossAxisSpacing = 10;
    return ((screenWidth / crossAxisCount) -
            (kHorizontalPadding * 2) -
            (crossAxisSpacing * (crossAxisCount - 1))) /
        fixedHeight;
  }
}
