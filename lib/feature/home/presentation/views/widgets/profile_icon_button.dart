import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/core/helper/api_keys.dart';
import 'package:tasky_app/core/utils/shared_preference_singleton.dart';

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
        await SharedPreferenceSingleton.setString(ApiKeys.accessToken, "value") ;
        log("set wrong access token for test") ;
        // Navigator.pushNamed(context, ProfileView.routeName);
      },
      child: SvgPicture.asset(Assets.imagesProfileIcon),
    );
  }
}
