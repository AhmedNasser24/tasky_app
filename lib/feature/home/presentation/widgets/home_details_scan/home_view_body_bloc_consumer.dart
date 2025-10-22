import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/routes/routes.dart';
import '../../../../../core/widgets/custom_model_progress_hud.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';

import '../../../../auth/presentation/views/login_view.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';
import 'home_view_body.dart';

class HomeViewBodyBlocConsumer extends StatelessWidget {
  const HomeViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskOperationCubit, TaskOperationState>(
      listener: (context, state) {
        if (state is DeleteTaskSuccess) {
          showSnackBarSuccess(context, "task is deleted successfully");
        } else if (state is DeleteTaskFailure) {
          showSnackBarFailure(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return BlocConsumer<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              BlocProvider.of<TaskOperationCubit>(context).initAllDataOfCubit() ;
              GoRouter.of(context).goNamed(AppRouter.login);
            } else if (state is LogoutFailure) {
              showSnackBarFailure(context, state.errMessage);
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
