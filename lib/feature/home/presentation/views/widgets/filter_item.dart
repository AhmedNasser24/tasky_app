import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/core/utils/app_styles.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.text,
    required this.isActive,
  });
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        color: isActive ? AppColor.primaryColor : const Color(0xFFF0ECFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Text(
        text,
        style: isActive
            ? AppStyles.bold16.copyWith(color: AppColor.whiteColor)
            : AppStyles.regular16.copyWith(color: AppColor.greyColor),
      ),
    );
  }
}
