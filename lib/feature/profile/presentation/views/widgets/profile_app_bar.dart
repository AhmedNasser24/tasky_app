
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_back_arrow_button.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const  Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          CustomBackArrowButton(),
          Gap(5),
          Text('Profile', style: AppStyles.bold16),
        ],
      ),
    );
  }
}
