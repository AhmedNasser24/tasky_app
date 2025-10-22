import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/routes/routes.dart';

import '../../../../../core/utils/theme/app_color.dart';

class CustomAddIconButton extends StatelessWidget {
  const CustomAddIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouter.create);
      },
      child: Container(
        width: 64,
        height: 64,
        decoration: ShapeDecoration(
          color: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x56000000),
              blurRadius: 32,
              offset: Offset(4, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            size: 32,
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
