import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/get_it_setup.dart';
import '../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../../../auth/data/repos/auth_repo.dart';
import 'widgets/custom_floating_button_for_home_view.dart';
import 'widgets/home_view_body_bloc_consumer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogoutCubit(getIt.get<AuthRepo>()),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: HomeViewBodyBlocConsumer(),
        ),
        floatingActionButton: CustomFloatingButtonForHomeView(),
      ),
    );
  }
}
