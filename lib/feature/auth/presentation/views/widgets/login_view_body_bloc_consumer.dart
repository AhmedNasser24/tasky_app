import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_model_progress_hud.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:tasky_app/feature/home/presentation/views/home_view.dart';

import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName) ;
        } else if (state is LoginFailure) {
          showSnackBarFailure(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          isLoading: state is LoginLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
