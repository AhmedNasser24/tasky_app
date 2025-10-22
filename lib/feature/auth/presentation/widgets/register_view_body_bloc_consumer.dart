
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/routes/routes.dart';
import '../../../../core/widgets/custom_model_progress_hud.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import '../manager/register_cubit/register_cubit.dart';

import 'register_view_body.dart';

class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.pushReplacementNamed(AppRouter.home);
        } else if (state is RegisterFailure) {
          showSnackBarFailure(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
            isLoading: state is RegisterLoading,
            child: const RegisterViewBody());
      },
    );
  }
}
