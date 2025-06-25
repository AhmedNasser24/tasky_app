import 'package:flutter/material.dart';

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
        constraints: const BoxConstraints(maxWidth: 340),
        child: Column(
          children: [
            CustomCachedNetworkImage(imageUrl: imgUrl),
          ],
        ),
      ),
    );
  }
}
