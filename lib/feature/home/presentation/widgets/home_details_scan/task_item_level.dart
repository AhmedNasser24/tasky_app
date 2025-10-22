import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_images.dart';
import '../../../../../core/utils/theme/app_font_styles.dart';

class TaskItemPriority extends StatelessWidget {
  const TaskItemPriority(this.level, {super.key, this.isDamy = false});
  final String level;
  final bool isDamy;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isDamy ? const Gap(0) : SvgPicture.asset(data[level.toLowerCase()]?[kFlag] ?? Assets.imagesLowFlag),
        const Gap(5),
        Text(
          level,
          style: AppStyles.medium12.copyWith(color: data[level.toLowerCase()]?[kColor] ?? Colors.black),
        ),
      ],
    );
  }

  Map<String, Map<String, dynamic>> get data => {
        kLow.toLowerCase(): {kFlag: Assets.imagesLowFlag, kColor: AppColor.blueColor},
        kMedium.toLowerCase(): {
          kFlag: Assets.imagesMediumFlag,
          kColor: AppColor.primaryColor
        },
        kHigh.toLowerCase(): {kFlag: Assets.imagesHeighFlag, kColor: AppColor.orangeColor},
      };
}
