
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_back_arrow_button.dart';

class CreateAppBar extends StatelessWidget {
  const CreateAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding , vertical: 12.0),
      child: Row(
        children: [
          CustomBackArrowButton(),
          Gap(8),
          Text('Add new task', style: AppStyles.bold16),
        ],
      ),
    );
  }
}
