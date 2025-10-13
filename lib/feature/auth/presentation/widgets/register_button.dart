import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import '../../domain/entities/user_info_entity.dart';

import '../../../../core/widgets/custom_button.dart';
import '../manager/register_cubit/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton( {super.key, required this.userInfoModel, required this.formKey});
  final UserInfoEntity userInfoModel ;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        if (userInfoModel.phone == null) {
          showSnackBarFailure(context, "phone is required");
          return;
        }
        if (formKey.currentState!.validate()) {
          BlocProvider.of<RegisterCubit>(context).register(userInfoModelInput : userInfoModel);
        }
      },
      title: "Sign up",
    );
  }
}
