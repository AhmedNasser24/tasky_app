import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/custom_model_progress_hud.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/auth/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:tasky_app/feature/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';

import '../../../../auth/presentation/views/login_view.dart';
import '../../manager/fetch_task_cubit/fetch_task_cubit.dart';
import 'home_view_body.dart';

class HomeViewBodyBlocConsumer extends StatelessWidget {
  const HomeViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          BlocProvider.of<FetchTaskCubit>(context).refresh();
        } else if (state is DeleteTaskFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return BlocConsumer<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginView.routeName, (_) => false);
            } else if (state is LogoutFailure) {
              showSnackBar(context, state.errMessage);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is LogoutLoading || state is DeleteTaskLoading,
              child: CustomModalProgressHud(
                isLoading: state is LogoutLoading || state is DeleteTaskLoading,
                child: const HomeViewBody(),
              ),
            );
          },
        );
      },
    );
  }
}
