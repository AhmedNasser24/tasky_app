import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';

import 'profile_app_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileAppBar(),
            Gap(24),
            Gap(kBottomSpace)
          ],
        ),
      ),
    );
  }
}
