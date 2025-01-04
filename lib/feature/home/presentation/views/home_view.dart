import 'package:flutter/material.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/custom_add_icon.dart';
import 'widgets/custom_qr_icon.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeViewBody(),
      ),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: CustomAddIconButton(),
          ),
          Positioned(
            right: 0.0,
            bottom: 80,
            child: CustomQrIconButton(),
          ),
        ],
      ),
    );
  }
}
