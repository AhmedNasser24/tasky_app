

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../profile/presentation/views/profile_view.dart';

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        
        Navigator.pushNamed(context, ProfileView.routeName);
      },
      child: SvgPicture.asset(Assets.imagesProfileIcon),
    );
  }
}
