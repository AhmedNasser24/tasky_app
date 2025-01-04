import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/utils/app_images.dart';

import '../../../../../core/utils/app_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Logo', style: AppStyles.bold24),
        const Spacer(),
        SvgPicture.asset(Assets.imagesProfileIcon),
        const Gap(20),
        SvgPicture.asset(Assets.imagesLogoutIcon),
      ],
    );
  }
}
