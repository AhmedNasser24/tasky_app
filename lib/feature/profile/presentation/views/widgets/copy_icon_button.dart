import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';

class CopyIconButton extends StatelessWidget {
  const CopyIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.imagesCopyIcon);
  }
}