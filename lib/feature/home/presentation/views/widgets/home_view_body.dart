import 'package:flutter/material.dart';
import 'package:tasky_app/constants.dart';

import 'home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
          ],
        ),
      ),
    );
  }
}
