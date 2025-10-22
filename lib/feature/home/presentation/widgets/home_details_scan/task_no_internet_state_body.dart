import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_font_styles.dart';

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
            const Icon(Icons.wifi_off, color: Colors.red , size: 100),
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
