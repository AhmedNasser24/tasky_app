import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSaved,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.semibold14,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      obscuringCharacter: '.',
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppStyles.regular14.copyWith(color: const Color(0xff7F7F7F)),
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
