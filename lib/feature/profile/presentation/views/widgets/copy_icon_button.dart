import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/core/widgets/show_snack_bar.dart';

import '../../../../../core/utils/app_images.dart';

class CopyIconButton extends StatelessWidget {
  const CopyIconButton({super.key, required this.textToCopy});

  final String textToCopy;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: textToCopy));
        showSnackBar(context, "Copied to clipboard");
      },
      child: SvgPicture.asset(Assets.imagesCopyIcon),
    );
  }
}
