import 'package:flutter/material.dart';
import '../../feature/home/domain/entities/task_entity.dart';
import 'animated_routes.dart';
import '../../feature/auth/presentation/views/register_view.dart';
import '../../feature/home/presentation/views/edit_view.dart';
import '../../feature/home/presentation/views/details_view.dart';

import '../../feature/auth/presentation/views/login_view.dart';
import '../../feature/home/presentation/views/create_view.dart';
import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/onboarding/presentation/views/onboarding_view.dart';
import '../../feature/profile/presentation/views/profile_view.dart';
import '../../feature/home/presentation/views/scan_code_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final arg = settings.arguments;
  switch (settings.name) {
    case OnboardingView.routeName:
      return animatedRoute(const OnboardingView());
    case LoginView.routeName:
      return animatedRoute(const LoginView());
    case RegisterView.routeName:
      return animatedRoute(const RegisterView());
    case HomeView.routeName:
      return animatedRoute(const HomeView());
    case CreateView.routeName:
      return animatedRoute(const CreateView());
    case DetailsView.routeName:
      return animatedRoute(DetailsView(taskEntity: arg as TaskEntity));
    case EditView.routeName:
      return animatedRoute(EditView(taskEntity: arg as TaskEntity));
    case ProfileView.routeName:
      return animatedRoute(const ProfileView());
    case ScanCodeView.routeName:
      return animatedRoute(const ScanCodeView());
    default:
      return animatedRoute(const Scaffold());
  }
}
