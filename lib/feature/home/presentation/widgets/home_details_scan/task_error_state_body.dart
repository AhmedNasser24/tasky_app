
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../manager/task_operation_cubit/task_operation_cubit.dart';
import 'task_loading_state_body.dart';

class TaskErrorStateBody extends StatelessWidget {
  const TaskErrorStateBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: CustomLoadingSkeletonizer()),
        GestureDetector(
          onTap: () => BlocProvider.of<TaskOperationCubit>(context).refresh(),
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
