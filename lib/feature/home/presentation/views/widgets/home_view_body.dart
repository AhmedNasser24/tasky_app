import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tasky_app/constants.dart';
import 'package:tasky_app/feature/home/presentation/manager/fetch_task_cubit/fetch_task_cubit.dart';
import 'package:tasky_app/feature/home/presentation/views/widgets/filter_buttons.dart';
import 'task_items_bloc_builder.dart';
import 'home_app_bar.dart';
import 'my_task_text.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<FetchTaskCubit>(context).checkConnectevity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: HomeAppBar(),
        ),
        Gap(24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: MyTaskText(),
        ),
        Padding(
          padding: EdgeInsets.only(left: kHorizontalPadding),
          child: FilterButtons(),
        ),
        Expanded(
          child: TaskItemsBlocBuilder(),
        ),
      ],
    );
  }
}
