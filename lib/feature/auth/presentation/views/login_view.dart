import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/login_cubit/login_cubit.dart';

import '../../../../core/utils/get_it_setup.dart';
import '../../data/repos/auth_repo.dart';
import 'widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepoImpl: getIt.get<AuthRepo>()),
      child: const Scaffold(
        body: SafeArea(
          child: LoginViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
