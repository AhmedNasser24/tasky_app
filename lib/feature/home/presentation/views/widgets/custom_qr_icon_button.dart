import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/feature/home/presentation/views/scan_code_view.dart';

import '../../../../../core/utils/app_images.dart';

class CustomQrIconButton extends StatelessWidget {
  const CustomQrIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ScanCodeView.routeName);
      } ,
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: ShapeDecoration(
          color: const Color(0xFFEAE5FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 32,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(child: SvgPicture.asset(Assets.imagesQrIcon)),
      ),
    );
  }
}
