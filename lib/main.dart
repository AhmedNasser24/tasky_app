import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/feature/auth/presentation/views/login_view.dart';
import 'core/helper/on_generate_route.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'DM Sans',
        scaffoldBackgroundColor: AppColor.whiteColor,
        colorScheme: ColorScheme.fromSeed(seedColor:AppColor.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: LoginView.routeName,
    );
  }
}
