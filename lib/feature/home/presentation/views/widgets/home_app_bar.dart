import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_styles.dart';
import 'logout_icon_button_bloc_consumer.dart';
import 'profile_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric( vertical: 12.0),
      child: Row(
        children: [
          Text('Logo', style: AppStyles.bold24),
          Spacer(),
          ProfileIconButton(),
          Gap(20),
          LogoutIconButtonBlocConsumer(),
        ],
      ),
    );
  }
}


