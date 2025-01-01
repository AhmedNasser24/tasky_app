import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomIntlPhoneField extends StatelessWidget {
  const CustomIntlPhoneField(
    this.userInfoModel, {
    super.key,
  });
  final UserInfoModel userInfoModel;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      flagsButtonPadding: const EdgeInsets.only(left: 8),
      style: AppStyles.medium14,
      disableLengthCheck: true,
      decoration: InputDecoration(
        hintText: 'Enter your phone number',
        hintStyle: AppStyles.regular14.copyWith(color: AppColor.greyColor),
        border: normalOutlineInputBorder(),
        enabledBorder: normalOutlineInputBorder(),
        focusedBorder: focusOutlineInputBorder(),
        errorBorder: outLineErrorInputBorder(),
      ),
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: Color(0xff7F7F7F),
      ),
      dropdownIconPosition: IconPosition.trailing,
      dropdownTextStyle: const TextStyle(color: Color(0xff7F7F7F)),
      initialCountryCode: 'EG',
      onChanged: (phone) {},
    );
  }

  OutlineInputBorder normalOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: Color(0xffBABABA),
      ),
    );
  }

  OutlineInputBorder focusOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 2,
        color: Color(0xffBABABA),
      ),
    );
  }

  OutlineInputBorder outLineErrorInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.5,
      ),
    );
  }
}
