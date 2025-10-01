import 'package:flutter/material.dart';
import 'package:tasky_app/core/models/task_model.dart';
import 'package:tasky_app/feature/auth/presentation/views/register_view.dart';
import 'package:tasky_app/feature/create_edit/presentation/views/edit_view.dart';
import 'package:tasky_app/feature/home/presentation/views/details_view.dart';

import '../../feature/auth/presentation/views/login_view.dart';
import '../../feature/create_edit/presentation/views/create_view.dart';
import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/onboarding/presentation/views/onboarding_view.dart';
import '../../feature/profile/presentation/views/profile_view.dart';
import '../../feature/home/presentation/views/scan_code_view.dart';
import '../../feature/splash/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final arg = settings.arguments;
  switch (settings.name) {
    
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case CreateView.routeName:
      return MaterialPageRoute(builder: (context) => const CreateView());
    case DetailsView.routeName:
      return MaterialPageRoute(builder: (context) =>  DetailsView(taskModel: arg as TaskModel));
    case EditView.routeName:
      return MaterialPageRoute(builder: (context) =>  EditView(taskModel: arg as TaskModel));     
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case ScanCodeView.routeName:
      return MaterialPageRoute(builder: (context) => const ScanCodeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
