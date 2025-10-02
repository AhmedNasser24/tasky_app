import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/utils/app_color.dart';
import 'package:tasky_app/core/utils/get_it_setup.dart';
import 'package:tasky_app/feature/splash/presentation/views/splash_view.dart';
import 'core/helper/on_generate_route.dart';
import 'core/utils/shared_preference_singleton.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceSingleton.init();
  Bloc.observer = SimpleBlocObserver();
  getItSetup();
  runApp(
    const TaskyApp(),
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}



// for testing
// class Page1 extends StatefulWidget {
//   const Page1({super.key});

//   @override
//   State<Page1> createState() => _Page1State();
// }

// class _Page1State extends State<Page1> {
//   bool x = false;
//   void change() {
//     setState(() {
//       x = !x;
//     });
//     log("change something");
//   }

//   @override
//   void initState() {
//     log("init state");
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     log("did change dependencies");
//     super.didChangeDependencies();
//   }

//   @override
//   void deactivate() {
//     log("deactivate");
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     log("dispose");
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Page 1"),
//       ),
//       body: Center(
//         child: TextButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Page2(
//                   change: change,
//                 ),
//               ),
//             );
//           },
//           child: Text(
//             x.toString(),
//             style: const TextStyle(fontSize: 40),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Page2 extends StatelessWidget {
//   const Page2({super.key, required this.change});
//   final void Function() change;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Page 2"),
//       ),
//       body: Center(
//         child: TextButton(
//           onPressed: change,
//           child: const Text(
//             "change something",
//             style: TextStyle(fontSize: 40),
//           ),
//         ),
//       ),
//     );
//   }
// }
