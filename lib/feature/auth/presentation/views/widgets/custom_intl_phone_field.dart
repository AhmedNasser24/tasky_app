import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomIntlPhoneField extends StatelessWidget {
  const CustomIntlPhoneField({
    super.key,
    this.onChanged,
  });
  final void Function(PhoneNumber)? onChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      autovalidateMode: AutovalidateMode.always,
      flagsButtonPadding: const EdgeInsets.only(left: 8),
      style: AppStyles.medium14,
      disableLengthCheck: true,    // set false , make it use default validation
      decoration: InputDecoration(
        hintText: 'Enter your phone number',
        hintStyle: AppStyles.regular14.copyWith(color: AppColor.greyColor),
        border: normalOutlineInputBorder(),
        enabledBorder: normalOutlineInputBorder(),
        focusedBorder: focusOutlineInputBorder(),
        errorBorder: outLineErrorInputBorder(),
        focusedErrorBorder: outLineErrorInputBorder(),
      ),
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: Color(0xff7F7F7F),
      ),
      dropdownIconPosition: IconPosition.trailing,
      dropdownTextStyle: const TextStyle(color: Color(0xff7F7F7F)),
      initialCountryCode: 'EG',
      onChanged: onChanged,
      onCountryChanged: (value) {},
      validator: (phone) async {
        if (phone == null || phone.number.isEmpty) return "field is required";
        try {
          phone.isValidNumber();
          return null;
        } catch (e) {
          if (e.toString().contains("NumberTooShortException")) {
            return "Number is too short";
          } else {
            return "Number is too long";
          }
        }
      },
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
