import 'package:flutter/material.dart';
import 'package:tasky_app/feature/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const String routeName = '/onboarding';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(
        child: OnboardingViewBody(),
      ),  
    );
  }
}