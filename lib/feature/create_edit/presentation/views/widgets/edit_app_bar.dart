import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_back_arrow_button.dart';

class EditAppBar extends StatelessWidget {
  const EditAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Stack(
        children: [
          Positioned(
            left: -5,
            top: -5,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: CustomBackArrowButton(),
            ),
          ),
          Row(
            children: [
              Gap(35),
              Text('Edit task', style: AppStyles.bold16),
            ],
          ),
        ],
      ),
    );
  }
}
