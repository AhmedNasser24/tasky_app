import 'package:flutter/material.dart';

Route animatedRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.linear;
      final curveTween = CurveTween(curve: curve);
      final opacityAnimation = animation.drive(curveTween);

      return FadeTransition(
        opacity: opacityAnimation,
        child: child,
      );
    },
  );
}
