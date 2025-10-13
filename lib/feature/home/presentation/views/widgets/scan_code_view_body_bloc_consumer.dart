import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../manager/fetch_one_task_cubit/fetch_one_task_cubit_cubit.dart';
import '../details_view.dart';
import 'scan_code_view_body.dart';

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
          showSnackBarFailure(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return  ScanCodeViewBody(state : state);
      },
    );
  }
}
