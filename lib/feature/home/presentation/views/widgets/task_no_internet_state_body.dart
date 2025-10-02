import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';

import '../../../../../core/utils/app_styles.dart';

class TaskNoInternetStateBody extends StatelessWidget {
  const TaskNoInternetStateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wifi_off, color: Colors.red , size: 150),
            Text(
              " No INTERNET CONNECTION",
              style: AppStyles.semibold16.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
