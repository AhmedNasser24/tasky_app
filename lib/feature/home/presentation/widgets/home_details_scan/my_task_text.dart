import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_color.dart';
import '../../../../../core/utils/theme/app_font_styles.dart';

class MyTaskText extends StatelessWidget {
  const MyTaskText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("My Tasks" , style : AppStyles.bold16.copyWith(color: AppColor.greyColor)),
        const Spacer(),
      ],
    );
  }
}