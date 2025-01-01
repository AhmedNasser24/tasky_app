import 'package:flutter/material.dart';
import 'package:tasky_app/constants.dart';

import 'custom_intl_phone_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric( horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomIntlPhoneField(),
            
          ],
        ),
      ),
    );
  }
}
