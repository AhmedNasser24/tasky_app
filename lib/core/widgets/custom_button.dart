import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';

import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.title});
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration:  const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.bold16.copyWith(color: AppColor.whiteColor),
          ),
        ),
      ),
    );
  }
}
