import 'package:flutter/material.dart';
import 'package:tasky_app/feature/auth/presentation/views/register_view.dart';

Route<dynamic>? onGenerateRoute (RouteSettings settings) {
  switch (settings.name) {
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}