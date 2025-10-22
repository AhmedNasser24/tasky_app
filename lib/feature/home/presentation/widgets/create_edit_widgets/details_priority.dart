import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_images.dart';
import '../../../../../core/utils/theme/app_font_styles.dart';

class DetailsPriority extends StatefulWidget {
  const DetailsPriority(this.priority , {super.key});
  final String priority ;

  @override
  State<DetailsPriority> createState() => _DetailsPriorityState();
}

class _DetailsPriorityState extends State<DetailsPriority> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kHorizontalPadding , vertical: 4),
      padding: const EdgeInsets.only(
            left: 24,
            right: 10,
          ),
          decoration: ShapeDecoration(
            color: const Color(0xFFF0ECFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        child: priorityWidget[widget.priority.toLowerCase()],  
    );
  }

  final Map<String, Widget> priorityWidget = {
    kLow.toLowerCase() : Row(
      children: [
        SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(Assets.imagesLowFlag)),
        const Gap(8),
        Text(
          "$kLow Priority",
          style: AppStyles.bold16.copyWith(color: AppColor.blueColor),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_drop_down_rounded,
          color: AppColor.blueColor,
          size: 50,
        ),
      ],
    ),
    kMedium.toLowerCase(): Row(
      children: [
        SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(Assets.imagesMediumFlag)),
        const Gap(8),
        Text(
          "$kMedium Priority",
          style: AppStyles.bold16.copyWith(color: AppColor.primaryColor),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_drop_down_rounded,
          color: AppColor.primaryColor,
          size: 50,
        ),
      ],
    ),
    kHigh.toLowerCase(): Row(
      children: [
        SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(Assets.imagesHeighFlag)),
        const Gap(8),
        Text(
          "$kHigh Priority",
          style: AppStyles.bold16.copyWith(color: AppColor.orangeColor),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_drop_down_rounded,
          color: AppColor.orangeColor,
          size: 50,
        ),
      ],
    ),
  };
}
