import 'package:flutter/material.dart';
import 'package:tasky_app/feature/auth/presentation/views/register_view.dart';

import '../../feature/auth/presentation/views/login_view.dart';
import '../../feature/create_edit/presentation/views/create_view.dart';
import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/profile/presentation/views/profile_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case CreateView.routeName:
      return MaterialPageRoute(builder: (context) => const CreateView());

    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
