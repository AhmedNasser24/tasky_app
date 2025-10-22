import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/routes/routes.dart';
import '../../../../../core/storage/shared_preference_singleton.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_images.dart';
import '../../../../../core/utils/theme/app_font_styles.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacementNamed(AppRouter.register);
        SharedPreferenceSingleton.setbool(kIsOnboardingVisited, true);
      },
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 380),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Let's Start",
                style: AppStyles.bold19.copyWith(color: AppColor.whiteColor),
              ),
              const Gap(8),
              SvgPicture.asset(Assets.imagesArrow),
            ],
          ),
        ),
      ),
    );
  }
}
