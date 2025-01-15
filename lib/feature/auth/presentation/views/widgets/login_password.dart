import 'package:flutter/material.dart';
import '../../../data/model/user_info_model.dart';
import '../../../../../core/widgets/custom_textformfield.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword(this.loginModel, {super.key});
  final UserInfoModel loginModel;
  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
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
      onChanged: (password) => widget.loginModel.password = password,
      validator: (password) {
        if (password == null || password.isEmpty) {
          return "field is required";
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
                color: Color(0xffC9CECF),
              )
            : const Icon(
                Icons.visibility_off_outlined,
                color: Color(0xffC9CECF),
              ),
      ),
    );
  }
}
