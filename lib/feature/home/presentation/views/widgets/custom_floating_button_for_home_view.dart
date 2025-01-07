
import 'package:flutter/material.dart';

import 'custom_add_icon.dart';
import 'custom_qr_icon.dart';

class CustomFloatingButtonForHomeView extends StatelessWidget {
  const CustomFloatingButtonForHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: CustomAddIconButton(),
        ),
        Positioned(
          right: 0.0,
          bottom: 80,
          child: CustomQrIconButton(),
        ),
      ],
    );
  }
}