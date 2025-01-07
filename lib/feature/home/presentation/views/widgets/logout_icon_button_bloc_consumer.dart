import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/feature/auth/presentation/manager/logout_cubit/logout_cubit.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class LogoutIconButtonBlocConsumer extends StatelessWidget {
  const LogoutIconButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        confirmLogoutDialog(context, BlocProvider.of<LogoutCubit>(context));
      },
      child: SvgPicture.asset(Assets.imagesLogoutIcon),
    );
  }

  confirmLogoutDialog(BuildContext context, LogoutCubit logoutCubit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm logout", style: AppStyles.semibold20),
          content: const Text("Do you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("cancel",
                  style: AppStyles.medium14
                      .copyWith(color: AppColor.primaryColor)),
            ),
            TextButton(
              onPressed: () {
                logoutCubit.logout();
                Navigator.of(context).pop();
              },
              child: Text("logout",
                  style: AppStyles.medium14
                      .copyWith(color: AppColor.primaryColor)),
            ),
          ],
        );
      },
    );
  }
}
