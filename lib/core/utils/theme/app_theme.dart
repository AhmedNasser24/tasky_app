import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/constants/app_constants.dart';
import 'package:tasky_app/core/utils/theme/app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: kAppFontFamily,
      scaffoldBackgroundColor: AppColor.whiteColor,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
    );
  }
}
