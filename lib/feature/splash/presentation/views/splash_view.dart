// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/core/utils/app_images.dart';
import 'package:tasky_app/core/utils/shared_preference_singleton.dart';

import '../../../../constants.dart';
import '../../../../core/helper/api_keys.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../onboarding/presentation/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!SharedPreferenceSingleton.getbool(kIsOnboardingVisited)) {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      } else {
        SharedPreferenceSingleton.getString(ApiKeys.accessToken).isNotEmpty
            ? Navigator.pushReplacementNamed(context, HomeView.routeName)
            : Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset(Assets.imagesLogoForMobile),
        ),
      ),
    );
  }
}
