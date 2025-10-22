

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_app/core/routes/routes.dart';

import '../../../../../core/utils/theme/app_images.dart';

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        
        context.pushNamed(AppRouter .profile);
      },
      child: SvgPicture.asset(Assets.imagesProfileIcon),
    );
  }
}
