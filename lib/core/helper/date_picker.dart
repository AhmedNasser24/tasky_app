import 'package:flutter/material.dart';

import '../utils/theme/app_color.dart';

Future<DateTime?> pickDate(context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColor.primaryColor, // Header background color
            onPrimary: Colors.white, // Header text color
            onSurface: Colors.black, // Body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColor.primaryColor, // Button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  return pickedDate;
}
