
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/task_loading_state_body.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../manager/fetch_task_cubit/fetch_task_cubit.dart';

class TaskErrorStateBody extends StatelessWidget {
  const TaskErrorStateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: TaskLoadingStateBody()),
        GestureDetector(
          onTap: () => BlocProvider.of<FetchTaskCubit>(context).refresh(),
          child: Container(
            width: double.infinity,
            color: AppColor.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                const Icon(Icons.refresh, color: Colors.white),
                Text(
                  'No INTERNET CONNECTION',
                  style: AppStyles.medium14.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
