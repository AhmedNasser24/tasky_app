import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/feature/auth/presentation/views/register_view.dart';

import '../../../../../core/utils/app_styles.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          "Don't have any account? ",
          style: AppStyles.regular14.copyWith(color: AppColor.greyColor),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RegisterView.routeName);
          },
          child: Text(
            "Sign Up here",
            style: AppStyles.regular14.copyWith(
                color: AppColor.primaryColor,
                decoration: TextDecoration.underline),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
