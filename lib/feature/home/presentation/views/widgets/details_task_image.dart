import 'package:flutter/material.dart';
import 'package:tasky_app/core/helper/media_query_extension.dart';

import '../../../../../constants.dart';
import 'custom_cached_network_image.dart';

class DetailsTaskImage extends StatelessWidget {
  const DetailsTaskImage({super.key, required this.imgUrl});
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Container(
        constraints:  BoxConstraints(maxWidth: context.screenWidth < 1200? 340 : 400),
        child: CustomCachedNetworkImage(imageUrl: imgUrl),
      ),
    );
  }
}
