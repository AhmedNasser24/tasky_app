import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/fetch_one_task_cubit/fetch_one_task_cubit_cubit.dart';

import '../../../../core/utils/get_it_setup.dart';
import '../../data/repo/home_repo.dart';
import 'widgets/scan_code_view_body_bloc_consumer.dart';

class ScanCodeView extends StatelessWidget {
  const ScanCodeView({super.key});
  static const String routeName = '/scan-code';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOneTaskCubitCubit(getIt.get<HomeRepo>()),
      child: const Scaffold(
        backgroundColor: Colors.black,
        body: ScanCodeViewBodyBlocConsumer(),
      ),
    );
  }
}
