import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/filter_buttons.dart';

import 'home_app_bar.dart';
import 'my_task_text.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            Gap(24),
            MyTaskText(),
            FilterButtons(),
          ],
        ),
      ),
    );
  }
}

