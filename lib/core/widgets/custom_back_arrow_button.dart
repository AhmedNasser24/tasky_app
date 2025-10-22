import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_images.dart';

class CustomBackArrowButton extends StatelessWidget {
  const CustomBackArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (context.canPop()) {
          context.pop();
        }
      },
      child: SvgPicture.asset(Assets.imagesBackArrowIcon),
    );
  }
}