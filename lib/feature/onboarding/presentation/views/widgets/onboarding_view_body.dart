import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/core/utils/app_images.dart';
import 'package:tasky_app/core/utils/app_styles.dart';

import '../../../../../constants.dart';
import 'start_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Image.asset(
                  Assets.imagesOnboarding,
                  fit: BoxFit.cover,
                )),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Task Management & To-Do List",
                      style: AppStyles.bold24,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "This productive tool is designed to help you better manage your task project-wise conveniently!",
                    style:
                        AppStyles.regular14.copyWith(color: AppColor.greyColor),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(50),
                  const StartButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
