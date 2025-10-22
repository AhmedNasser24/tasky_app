import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/theme/app_color.dart';

import '../utils/theme/app_font_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.maxLines = 1,
    this.hintStyle,
    this.textStyle,
    this.filled,
    this.fillColor,
    this.borderSide,
    this.autovalidateMode,
    this.inputFormatters,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon, prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final bool readOnly;
  final TextEditingController? controller;
  final int? maxLines;
  final TextStyle? textStyle, hintStyle;
  final Color? fillColor;
  final bool? filled;
  final double? borderSide;
  final AutovalidateMode? autovalidateMode ;
  final List<TextInputFormatter>? inputFormatters ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters ,
      controller: controller,
      style: textStyle ?? AppStyles.medium14,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      obscuringCharacter: '.',
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ??
            AppStyles.regular14.copyWith(color: AppColor.greyColor),
        filled: filled,
        fillColor: fillColor,
        border: normalOutlineInputBorder(),
        enabledBorder: normalOutlineInputBorder(),
        focusedBorder: focusOutlineInputBorder(),
        errorBorder: outLineErrorInputBorder(),
      ),
    );
  }

  OutlineInputBorder normalOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: borderSide ?? 1,
        color: const Color(0xffBABABA),
      ),
    );
  }

  OutlineInputBorder focusOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: borderSide ?? 2,
        color: const Color(0xffBABABA),
      ),
    );
  }

  OutlineInputBorder outLineErrorInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.red,
        width: borderSide ?? 1.5,
      ),
    );
  }
}
