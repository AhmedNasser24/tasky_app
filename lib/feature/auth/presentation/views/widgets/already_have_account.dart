import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';

import '../../../../../core/utils/app_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        const Spacer(),
        Text(
          "Already have any account? ",
          style: AppStyles.regular14.copyWith(color: AppColor.greyColor),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Sign in",
            style: AppStyles.regular14.copyWith(color: AppColor.primaryColor),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
