import 'package:flutter/material.dart';
import 'package:tasky_app/feature/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: RegisterViewBody(),
      ),
    );
  }
}
