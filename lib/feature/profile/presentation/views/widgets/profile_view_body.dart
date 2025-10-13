import 'package:flutter/material.dart';
import '../../../data/get_profile_data.dart';
import '../../../../../constants.dart';
import '../../../../../core/helper/media_query_extension.dart';
import '../../../../auth/domain/entities/user_info_entity.dart';
import 'profile_text_form_field.dart';

import 'profile_app_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfoEntity profileData = getProfileData();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Center(
        child: Column(
          children: [
            const ProfileAppBar(),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:context.screenWidth < 800 ? 1 : 2, // number of columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
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
                ],
              ),
            ),
          ],
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
