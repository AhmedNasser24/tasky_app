import 'dart:io';

import 'package:flutter/material.dart';

import 'custom_add_icon.dart';
import 'custom_qr_icon_button.dart';

class CustomFloatingButtonForHomeView extends StatelessWidget {
  const CustomFloatingButtonForHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = Platform.isAndroid || Platform.isIOS;
    return Stack(
      children: [
        const Positioned(
          right: 0.0,
          bottom: 20,
          child: CustomAddIconButton(),
        ),
        Positioned(
          right: 0.0,
          bottom: 100,
          child: isMobile ? const CustomQrIconButton() : const SizedBox(),
        )
      ],
    );
  }
}
