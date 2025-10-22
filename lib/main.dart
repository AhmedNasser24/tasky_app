import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/routes/app_router.dart';
import 'package:tasky_app/core/utils/theme/app_theme.dart';
import 'core/dependency_injection/get_it_setup.dart' as di;
import 'feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';
import 'core/storage/shared_preference_singleton.dart';
import 'core/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceSingleton.init();
  Bloc.observer = MyBlocObserver();
  di.getItSetup();
  runApp(
    const TaskyApp(),
  );
}

// GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<TaskOperationCubit>(),
      child: MaterialApp.router(
        routerConfig: appRouter,
        // navigatorKey: navigatorKey,
        theme: AppTheme.lightTheme,

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
