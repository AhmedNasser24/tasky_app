
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/extensions/media_query_extension.dart';
import 'damy_task_item.dart';

class CustomLoadingSkeletonizer extends StatelessWidget {
  const CustomLoadingSkeletonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  responsiveCrossAxisCount(context).toInt(), // number of columns
              crossAxisSpacing: 10,
              mainAxisSpacing: 24,
              childAspectRatio: 
                  aspectRatioToShowChildWithFixedHeight(context),
            ),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => const Skeletonizer(enabled: true, child: DamyTaskItem()),
      ),
    );
  }
  
  double aspectRatioToShowChildWithFixedHeight(BuildContext context) {
    double screenWidth = context.screenWidth;
    double fixedHeight = responsiveHeight(screenWidth);
    double crossAxisCount = responsiveCrossAxisCount(context);
    double crossAxisSpacing = 10;
    return ((screenWidth / crossAxisCount) -
            (kHorizontalPadding * 2) -
            (crossAxisSpacing * (crossAxisCount - 1))) /
        fixedHeight;                   // this calculation to make fixed height
  }
    double responsiveHeight(double screenWidth){
     if (screenWidth < 1200) {
      return 70;
    }else if (screenWidth < 1500){
      return 75;
    }else {
      return 80 ;
    }
  }
  double responsiveCrossAxisCount(BuildContext context) {
    double screenWidth = context.screenWidth;
    if (screenWidth < 720) {
      return 1;
    } else if (screenWidth < 1200) {
      return 2;
    } else {
      return 3;
    }
  }
}