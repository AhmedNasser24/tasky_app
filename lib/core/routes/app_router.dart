import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/utils/constants/app_constants.dart';
import 'package:tasky_app/core/utils/constants/api_keys.dart';
import 'package:tasky_app/core/routes/routes.dart';
import 'package:tasky_app/core/storage/shared_preference_singleton.dart';
import 'package:tasky_app/feature/auth/presentation/views/login_view.dart';
import 'package:tasky_app/feature/auth/presentation/views/register_view.dart';
import 'package:tasky_app/feature/home/domain/entities/task_entity.dart';
import 'package:tasky_app/feature/home/presentation/views/create_view.dart';
import 'package:tasky_app/feature/home/presentation/views/details_view.dart';
import 'package:tasky_app/feature/home/presentation/views/edit_view.dart';
import 'package:tasky_app/feature/home/presentation/views/home_view.dart';
import 'package:tasky_app/feature/home/presentation/views/scan_code_view.dart';
import 'package:tasky_app/feature/onboarding/presentation/views/onboarding_view.dart';
import 'package:tasky_app/feature/profile/presentation/views/profile_view.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

// Animation Types Enum
enum AnimationType {
  fade,
  slide,
  scale,
  rotation,
  slideFromBottom,
  slideFromTop,
  slideFromLeft,
  slideFromRight,
  cupertino,
}

// Custom Page Builder with Animation Support
Page<T> buildAnimatedPage<T extends Object?>({
  required Widget child,
  required LocalKey key,
  AnimationType animationType = AnimationType.fade,
  Duration duration = const Duration(milliseconds: 300),
  Curve curve = Curves.easeInOut,
}) {
  // Use Cupertino page for iOS
  if (Platform.isIOS && animationType == AnimationType.cupertino) {
    return CupertinoPage<T>(key: key, child: child);
  }

  return CustomTransitionPage<T>(
    key: key,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return _getAnimationTransition(
        animationType,
        animation,
        secondaryAnimation,
        child,
        curve,
      );
    },
  );
}

// Animation Builder Function
Widget _getAnimationTransition(
  AnimationType type,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
  Curve curve,
) {
  final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

  switch (type) {
    case AnimationType.fade:
      return FadeTransition(opacity: curvedAnimation, child: child);

    case AnimationType.slide:
    case AnimationType.slideFromRight:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );

    case AnimationType.slideFromLeft:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );

    case AnimationType.slideFromBottom:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );

    case AnimationType.slideFromTop:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );

    case AnimationType.scale:
      return ScaleTransition(
        scale: curvedAnimation,
        child: FadeTransition(opacity: curvedAnimation, child: child),
      );

    case AnimationType.rotation:
      return RotationTransition(
        turns: curvedAnimation,
        child: FadeTransition(opacity: curvedAnimation, child: child),
      );

    case AnimationType.cupertino:
      return FadeTransition(opacity: curvedAnimation, child: child);
  }
}

// Enhanced Custom Transition Page
class CustomTransitionPage<T> extends Page<T> {
  const CustomTransitionPage({
    required this.child,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
    this.transitionsBuilder,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;
  final Duration transitionDuration;
  final Duration reverseTransitionDuration;
  final RouteTransitionsBuilder? transitionsBuilder;

  @override
  Route<T> createRoute(BuildContext context) {
    return _PageBasedPageRoute<T>(
      page: this,
      transitionsBuilder: transitionsBuilder,
    );
  }
}

class _PageBasedPageRoute<T> extends PageRoute<T> {
  _PageBasedPageRoute({
    required CustomTransitionPage<T> page,
    this.transitionsBuilder,
  }) : super(settings: page);

  CustomTransitionPage<T> get _page => settings as CustomTransitionPage<T>;
  final RouteTransitionsBuilder? transitionsBuilder;

  @override
  bool get barrierDismissible => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => _page.transitionDuration;

  @override
  Duration get reverseTransitionDuration => _page.reverseTransitionDuration;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _page.child;
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return transitionsBuilder?.call(
          context,
          animation,
          secondaryAnimation,
          child,
        ) ??
        FadeTransition(opacity: animation, child: child);
  }
}

String get _initialLocation {
  if (!SharedPreferenceSingleton.getbool(kIsOnboardingVisited)) {
    return AppRouter.onboarding;
  } else {
    if (SharedPreferenceSingleton.getString(ApiKeys.accessToken).isNotEmpty) {
      return AppRouter.home;
    } else {
      return AppRouter.login;
    }
  }
}

final GoRouter appRouter = GoRouter(
    observers: [routeObserver],
    initialLocation: _initialLocation,
    routes: [
      GoRoute(
          path: AppRouter.onboarding,
          name: AppRouter.onboarding,
          pageBuilder: (context, state) => buildAnimatedPage(
                key: state.pageKey,
                child: const OnboardingView(),
                animationType: AnimationType.fade,
                duration: const Duration(milliseconds: 400),
                curve: Curves.elasticOut,
              )),
      GoRoute(
        path: AppRouter.login,
        name: AppRouter.login,
        pageBuilder: (context, state) {
          final bool initOperationTaskCubit = state.extra as bool? ?? false;
          return buildAnimatedPage(
            key: state.pageKey,
            child: LoginView(initOperationTaskCubit: initOperationTaskCubit),
            animationType: AnimationType.slideFromRight,
            duration: const Duration(milliseconds: 400),
            curve: Curves.elasticOut,
          );
        },
      ),
      GoRoute(
        path: AppRouter.register,
        name: AppRouter.register,
        pageBuilder: (context, state) => buildAnimatedPage(
          key: state.pageKey,
          child: const RegisterView(),
          animationType: AnimationType.slideFromRight,
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
        ),
      ),
      GoRoute(
        path: AppRouter.home,
        name: AppRouter.home,
        pageBuilder: (context, state) => buildAnimatedPage(
          key: state.pageKey,
          child: const HomeView(),
          animationType: AnimationType.slideFromBottom,
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
        ),
      ),
      GoRoute(
        path: AppRouter.details,
        name: AppRouter.details,
        pageBuilder: (context, state) {
          final taskEntity = state.extra as TaskEntity;
          return buildAnimatedPage(
            key: state.pageKey,
            child: DetailsView(taskEntity: taskEntity),
            animationType: AnimationType.fade,
            duration: const Duration(milliseconds: 400),
            curve: Curves.elasticOut,
          );
        },
      ),
      GoRoute(
        path: AppRouter.edit,
        name: AppRouter.edit,
        pageBuilder: (context, state) {
          final taskEntity = state.extra as TaskEntity;
          return buildAnimatedPage(
            key: state.pageKey,
            child: EditView(taskEntity: taskEntity),
            animationType: AnimationType.fade,
            duration: const Duration(milliseconds: 400),
            curve: Curves.elasticOut,
          );
        },
      ),
      GoRoute(
        path: AppRouter.create,
        name: AppRouter.create,
        pageBuilder: (context, state) => buildAnimatedPage(
          key: state.pageKey,
          child: const CreateView(),
          animationType: AnimationType.fade,
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
        ),
      ),
      GoRoute(
        path: AppRouter.scanCode,
        name: AppRouter.scanCode,
        pageBuilder: (context, state) => buildAnimatedPage(
          key: state.pageKey,
          child: const ScanCodeView(),
          animationType: AnimationType.fade,
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
        ),
      ),
      GoRoute(
        path: AppRouter.profile,
        name: AppRouter.profile,
        pageBuilder: (context, state) => buildAnimatedPage(
          key: state.pageKey,
          child: const ProfileView(),
          animationType: AnimationType.fade,
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
        ),
      ),
    ]);
