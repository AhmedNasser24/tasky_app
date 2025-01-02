import 'package:flutter/material.dart';
import 'package:tasky_app/feature/auth/data/model/user_info_model.dart';
import 'custom_textformfield.dart';

class RegisterPassword extends StatefulWidget {
  const RegisterPassword(this.userInfoModel, {super.key});
  final UserInfoModel userInfoModel;
  @override
  State<RegisterPassword> createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  late bool obscureText;
  @override
  void initState() {
    obscureText = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Password...",
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      onChanged: (password) => widget.userInfoModel.password = password,
      validator: (password) {
        if (password == null || password.isEmpty) {
          return "field is required";
        }
        if (password.length < 6) {
          return "password is too weak" ;
        }
        return null;
      },
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_outlined,
                color: Color(0xffBABABA),
              )
            : const Icon(
                Icons.visibility_off_outlined,
                color: Color(0xffBABABA),
              ),
      ),
    );
  }
}
