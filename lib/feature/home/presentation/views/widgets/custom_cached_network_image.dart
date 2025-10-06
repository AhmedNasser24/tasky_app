import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 340, maxWidth: 340),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 340, maxWidth: 340),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage(Assets.imagesTaskyPicture),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
