
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../constants.dart';
import 'damy_task_item.dart';

class CustomLoadingSkeletonizer extends StatelessWidget {
  const CustomLoadingSkeletonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Skeletonizer(
        enabled: true,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) => const DamyTaskItem(),
        ),
      ),
    );
  }
}