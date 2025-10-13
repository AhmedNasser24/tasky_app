import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'refresh_icon_button.dart';

import '../../../../../core/utils/app_styles.dart';
import 'logout_icon_button_bloc_consumer.dart';
import 'profile_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Platform.isAndroid || Platform.isIOS;
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          const Text('Logo', style: AppStyles.bold24),
          const Spacer(),
          isMobile? const SizedBox() : const RefreshIconButton(),
          const Gap(10),
          const ProfileIconButton(),
          const Gap(20),
          const LogoutIconButtonBlocConsumer(),
        ],
      ),
    );
  }
}
