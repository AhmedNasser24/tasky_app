import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_color.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.controller,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved ;
  final void Function()? onTap ;
  final bool readOnly ;
  final TextEditingController? controller ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppStyles.medium14,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      obscuringCharacter: '.',
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap ,
      readOnly: readOnly,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppStyles.regular14.copyWith(color: AppColor.greyColor),
        border: normalOutlineInputBorder(),
        enabledBorder: normalOutlineInputBorder(),
        focusedBorder: focusOutlineInputBorder(),
        errorBorder: outLineErrorInputBorder(),
      ),
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
      );}
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
