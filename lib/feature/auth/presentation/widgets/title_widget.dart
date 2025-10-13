import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
    this.title, {
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppStyles.bold24),
        const Spacer(),
      ],
    );
  }
}