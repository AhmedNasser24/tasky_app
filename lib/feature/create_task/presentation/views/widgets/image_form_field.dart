import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/core/utils/app_styles.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';

class ImageFormField extends StatelessWidget {
  const ImageFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColor.primaryColor,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.imagesImageIcon),
          const Gap(8),
          const Text("Add Img", style: AppStyles.medium19),
        ],
      ),
    );
  }
}
