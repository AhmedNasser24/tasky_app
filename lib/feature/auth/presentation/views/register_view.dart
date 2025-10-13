import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/register_cubit/register_cubit.dart';

import '../../../../core/utils/get_it_setup.dart' as di;
import '../widgets/register_view_body_bloc_consumer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<RegisterCubit>(),
      child: const Scaffold(
        body: SafeArea(
          child: RegisterViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
