import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/routes/routes.dart';
import '../../../../core/utils/theme/app_color.dart';

import '../../../../core/utils/theme/app_font_styles.dart';

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
            GoRouter.of(context).pushReplacementNamed( AppRouter.login);
          },
          child: Text(
            "Sign in",
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
