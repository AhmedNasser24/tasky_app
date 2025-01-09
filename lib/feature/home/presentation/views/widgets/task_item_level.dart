import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/core/utils/app_images.dart';
import 'package:tasky_app/core/utils/app_styles.dart';

class TaskItemLevel extends StatelessWidget {
  const TaskItemLevel(this.level, {super.key, this.isDamy = false});
  final String level;
  final bool isDamy;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isDamy ? const Gap(0) : SvgPicture.asset(data[level]![kFlag]),
        const Gap(5),
        Text(
          level,
          style: AppStyles.medium12.copyWith(color: data[level]![kColor]),
        ),
      ],
    );
  }

  Map<String, Map<String, dynamic>> get data => {
        kLow: {kFlag: Assets.imagesLowFlag, kColor: const Color(0xff0087FF)},
        kMedium: {
          kFlag: Assets.imagesMediumFlag,
          kColor: AppColor.primaryColor
        },
        kHigh: {kFlag: Assets.imagesHeighFlag, kColor: const Color(0xFFFF7D53)},
      };
}
