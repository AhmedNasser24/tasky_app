import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_images.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fromApi = true,
  });

  final String imageUrl;
  final bool fromApi;
  @override
  Widget build(BuildContext context) {
    log("imageUrl : $imageUrl");

    if (!fromApi) {
      return const ShowErrorWidget();
    }
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
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CircularProgressIndicator(
              value: progress.progress,
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const ShowErrorWidget(),
    );
  }
}

class ShowErrorWidget extends StatelessWidget {
  const ShowErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
    );
  }
}
