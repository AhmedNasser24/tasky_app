import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_font_styles.dart';

class DetailsStatues extends StatefulWidget {
  const DetailsStatues(this.statues , {super.key});
  final String statues ;
  @override
  State<DetailsStatues> createState() => _DetailsStatuesState();
}

class _DetailsStatuesState extends State<DetailsStatues> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: 4),
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
      child: statuesWidget[widget.statues.toLowerCase()],
    );
  }

  final Map<String, Widget> statuesWidget = {
    kWaiting.toLowerCase(): Row(
      children: [
        Text(
          kWaiting,
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
    kInprogress.toLowerCase(): Row(
      children: [
        Text(
          kInprogress,
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
    kFinished.toLowerCase(): Row(
      children: [
        Text(
          kFinished,
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
  };
}
