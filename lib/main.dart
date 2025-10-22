import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/routes/app_router.dart';
import 'core/utils/app_color.dart';
import 'core/utils/get_it_setup.dart' as di;
import 'feature/home/presentation/manager/task_operation_cubit/task_operation_cubit.dart';
import 'core/utils/shared_preference_singleton.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceSingleton.init();
  Bloc.observer = SimpleBlocObserver();
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
        theme: ThemeData(
          fontFamily: 'DM Sans',
          scaffoldBackgroundColor: AppColor.whiteColor,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
