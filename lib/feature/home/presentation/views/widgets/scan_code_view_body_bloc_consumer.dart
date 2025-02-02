import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';
import 'package:tasky_app/feature/home/presentation/manager/fetch_one_task_cubit/fetch_one_task_cubit_cubit.dart';
import 'package:tasky_app/feature/home/presentation/views/details_view.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/scan_code_view_body.dart';

class ScanCodeViewBodyBlocConsumer extends StatelessWidget {
  const ScanCodeViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchOneTaskCubitCubit, FetchOneTaskCubitState>(
      listener: (context, state) {
        if (state is FetchOneTaskCubitSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsView(taskModel: state.taskModel)));
        } else if (state is FetchOneTaskCubitFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return  ScanCodeViewBody(state : state);
      },
    );
  }
}
